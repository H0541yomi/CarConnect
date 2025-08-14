from flask import Blueprint, request, jsonify, current_app
from backend.db_connection import db

event_resources = Blueprint("event_resources", __name__)

@event_resources.route("/", methods=["GET"])
def get_event_resources():
    """
    GET /event_resources/?event_id=...&plan_id=...
    Returns resource plans. Each plan includes its equipment and supplies arrays.
    """
    event_id = request.args.get("event_id", type=int)
    plan_id  = request.args.get("plan_id",  type=int)

    current_app.logger.info(
        "HIT get_event_resources with event_id=%s plan_id=%s",
        event_id, plan_id
    )

    where = []
    vals  = []
    if event_id is not None:
        where.append("rt.EventId = %s")
        vals.append(event_id)
    if plan_id is not None:
        where.append("rt.PlanId = %s")
        vals.append(plan_id)

    base = """
        SELECT
            rt.PlanId, rt.EventId, rt.Notes,
            el.EquipmentListId AS EquipRowID,
            el.Equipment       AS Equipment,
            el.Amount          AS EquipmentAmount,
            sl.SupplyListId    AS SupplyRowID,
            sl.Supply          AS Supply,
            sl.Amount          AS SupplyAmount
        FROM Resources_Templates rt
        LEFT JOIN Equipment_List el ON el.PlanId = rt.PlanId
        LEFT JOIN Supply_List   sl ON sl.PlanId = rt.PlanId
    """
    if where:
        base += " WHERE " + " AND ".join(where)
    base += " ORDER BY rt.PlanId"

    conn = db.get_db()
    cur  = conn.cursor()
    cur.execute(base, tuple(vals))
    rows = cur.fetchall()

    # helper: safe int cast
    def to_int(v):
        try:
            return int(v) if v is not None else None
        except (TypeError, ValueError):
            return None

    plans = {}

    # If cursor returned tuples, build a name->value dict per row using description.
    colnames = [c[0] for c in cur.description]

    for row in rows:
        if isinstance(row, dict):
            r = row
        else:
            r = dict(zip(colnames, row))

        PlanId          = r.get("PlanId")
        EventId         = r.get("EventId")
        Notes           = r.get("Notes")
        EquipRowID      = r.get("EquipRowID")
        Equipment       = r.get("Equipment")
        EquipmentAmount = r.get("EquipmentAmount")
        SupplyRowID     = r.get("SupplyRowID")
        Supply          = r.get("Supply")
        SupplyAmount    = r.get("SupplyAmount")

        p = plans.setdefault(PlanId, {
            "PlanId": PlanId,
            "EventId": EventId,
            "Notes": Notes,
            "equipment": [],
            "supplies": []
        })

        if EquipRowID is not None:
            p["equipment"].append({
                "RowID": EquipRowID,
                "Equipment": Equipment,
                "Amount": to_int(EquipmentAmount)
            })
        if SupplyRowID is not None:
            p["supplies"].append({
                "RowID": SupplyRowID,
                "Supply": Supply,
                "Amount": to_int(SupplyAmount)
            })

    return jsonify(list(plans.values())), 200
@event_resources.route("/", methods=["POST"])
def create_event_resources():
    """
    POST /event_resources/
    Body JSON:
    {
      "EventId": 1,                 # required, must exist in Event table
      "Notes": "string",            # optional
      "equipment": [                # optional
        {"Equipment": "string", "Amount": 2},
        ...
      ],
      "supplies": [                 # optional
        {"Supply": "string", "Amount": 5},
        ...
      ]
    }
    """
    data = request.get_json(silent=True) or {}
    event_id = data.get("EventId")
    notes    = data.get("Notes")

    if event_id is None:
        return jsonify({"error": "EventId is required"}), 400

    equipment = data.get("equipment") or []
    supplies  = data.get("supplies") or []

    # Basic shape/type checks (kept lightweight)
    if not isinstance(equipment, list) or not isinstance(supplies, list):
        return jsonify({"error": "equipment and supplies must be arrays"}), 400

    conn = db.get_db()
    cur  = conn.cursor()

    try:
        # Start transaction explicitly (flask-mysql usually autocommits; be explicit)
        conn.begin()

        # 1) Insert the plan
        cur.execute(
            "INSERT INTO Resources_Templates (EventId, Notes) VALUES (%s, %s)",
            (event_id, notes)
        )
        plan_id = cur.lastrowid

        # 2) Bulk insert equipment (if any)
        equip_rows = []
        for row in equipment:
            if not isinstance(row, dict):
                return jsonify({"error": "Each equipment row must be an object"}), 400
            name   = row.get("Equipment")
            amount = row.get("Amount", 0)
            if not name:
                return jsonify({"error": "Equipment name missing"}), 400
            equip_rows.append((plan_id, name, int(amount or 0)))
        if equip_rows:
            cur.executemany(
                "INSERT INTO Equipment_List (PlanId, Equipment, Amount) VALUES (%s, %s, %s)",
                equip_rows
            )

        # 3) Bulk insert supplies (if any)
        supply_rows = []
        for row in supplies:
            if not isinstance(row, dict):
                return jsonify({"error": "Each supply row must be an object"}), 400
            name   = row.get("Supply")
            amount = row.get("Amount", 0)
            if not name:
                return jsonify({"error": "Supply name missing"}), 400
            supply_rows.append((plan_id, name, int(amount or 0)))
        if supply_rows:
            cur.executemany(
                "INSERT INTO Supply_List (PlanId, Supply, Amount) VALUES (%s, %s, %s)",
                supply_rows
            )

        conn.commit()

        # Build response payload (mirrors GET format)
        return (
            jsonify({
                "PlanId": plan_id,
                "EventId": event_id,
                "Notes": notes,
                "equipment": [
                    {"RowID": None, "Equipment": e[1], "Amount": e[2]} for e in equip_rows
                ],
                "supplies": [
                    {"RowID": None, "Supply": s[1], "Amount": s[2]} for s in supply_rows
                ],
            }),
            201,
            {"Location": f"/event_resources/?plan_id={plan_id}"}
        )

    except pymysql.err.IntegrityError as e:
        # Most common: FK fails because EventId doesn't exist
        conn.rollback()
        return jsonify({"error": "Insert failed (likely bad EventId or constraints).", "detail": str(e)}), 400
    except Exception as e:
        conn.rollback()
        current_app.logger.exception("create_event_resources failed")
        return jsonify({"error": "Internal error", "detail": str(e)}), 500



@event_resources.route("/<int:PlanId>", methods=["PUT"])
def update_event_resources(PlanId):
    """
    PUT /event_resources/<PlanId>

    Body JSON (all fields optional; only provided ones are updated):
    {
      "EventId": 1,
      "Notes": "string",
      "equipment": [ { "Equipment": "string", "Amount": 2 }, ... ],
      "supplies":  [ { "Supply": "string",    "Amount": 5 }, ... ]
    }
    """
    import pymysql
    from flask import current_app, request, jsonify

    def _to_int(v, default=None):
        if v is None or v == "":
            return default
        try:
            return int(v)
        except (TypeError, ValueError):
            return default

    data = request.get_json(silent=True) or {}

    event_id  = data.get("EventId", None)
    notes     = data.get("Notes", None)
    has_equip = "equipment" in data
    has_sup   = "supplies"  in data

    equipment = data.get("equipment") if has_equip else None
    supplies  = data.get("supplies")  if has_sup   else None

    if has_equip and not isinstance(equipment, list):
        return jsonify({"error": "equipment must be an array"}), 400
    if has_sup and not isinstance(supplies, list):
        return jsonify({"error": "supplies must be an array"}), 400

    conn = db.get_db()
    # Force a tuple cursor so fetches return tuples, not dicts
    cur  = conn.cursor(pymysql.cursors.Cursor)

    try:
        conn.begin()

        # Ensure the plan exists
        cur.execute(
            "SELECT PlanId, EventId, Notes FROM Resources_Templates WHERE PlanId = %s",
            (PlanId,)
        )
        row = cur.fetchone()
        if not row:
            conn.rollback()
            return jsonify({"error": f"PlanId {PlanId} not found"}), 404

        # Update plan fields that were provided
        set_parts = []
        vals      = []
        if event_id is not None:
            set_parts.append("EventId = %s")
            vals.append(event_id)
        if notes is not None:
            set_parts.append("Notes = %s")
            vals.append(notes)

        if set_parts:
            vals.append(PlanId)
            cur.execute(
                f"UPDATE Resources_Templates SET {', '.join(set_parts)} WHERE PlanId = %s",
                tuple(vals)
            )

        # Replace equipment if provided
        if has_equip:
            cur.execute("DELETE FROM Equipment_List WHERE PlanId = %s", (PlanId,))
            if equipment:
                equip_rows = []
                for item in equipment:
                    if not isinstance(item, dict):
                        raise ValueError("Each equipment item must be an object")
                    name   = item.get("Equipment")
                    amount = _to_int(item.get("Amount"), 0)
                    if not name:
                        raise ValueError("Equipment name missing")
                    equip_rows.append((PlanId, name, amount))
                cur.executemany(
                    "INSERT INTO Equipment_List (PlanId, Equipment, Amount) VALUES (%s, %s, %s)",
                    equip_rows
                )

        # Replace supplies if provided
        if has_sup:
            cur.execute("DELETE FROM Supply_List WHERE PlanId = %s", (PlanId,))
            if supplies:
                supply_rows = []
                for item in supplies:
                    if not isinstance(item, dict):
                        raise ValueError("Each supply item must be an object")
                    name   = item.get("Supply")
                    amount = _to_int(item.get("Amount"), 0)
                    if not name:
                        raise ValueError("Supply name missing")
                    supply_rows.append((PlanId, name, amount))
                cur.executemany(
                    "INSERT INTO Supply_List (PlanId, Supply, Amount) VALUES (%s, %s, %s)",
                    supply_rows
                )

        # Return the updated plan (same shape as GET)
        cur.execute("""
            SELECT
                rt.PlanId, rt.EventId, rt.Notes,
                el.EquipmentListId AS EquipRowID,
                el.Equipment       AS Equipment,
                el.Amount          AS EquipmentAmount,
                sl.SupplyListId    AS SupplyRowID,
                sl.Supply          AS Supply,
                sl.Amount          AS SupplyAmount
            FROM Resources_Templates rt
            LEFT JOIN Equipment_List el ON el.PlanId = rt.PlanId
            LEFT JOIN Supply_List   sl ON sl.PlanId = rt.PlanId
            WHERE rt.PlanId = %s
            ORDER BY rt.PlanId
        """, (PlanId,))

        plans = {}
        for (PlanIdRow, EventIdRow, NotesRow,
             EquipRowID, EquipmentName, EquipmentAmount,
             SupplyRowID, SupplyName, SupplyAmount) in cur.fetchall():

            p = plans.setdefault(PlanIdRow, {
                "PlanId": PlanIdRow,
                "EventId": EventIdRow,
                "Notes": NotesRow,
                "equipment": [],
                "supplies": []
            })
            if EquipRowID is not None:
                p["equipment"].append({
                    "RowID": EquipRowID,
                    "Equipment": EquipmentName,
                    "Amount": _to_int(EquipmentAmount)
                })
            if SupplyRowID is not None:
                p["supplies"].append({
                    "RowID": SupplyRowID,
                    "Supply": SupplyName,
                    "Amount": _to_int(SupplyAmount)
                })

        conn.commit()
        updated = list(plans.values())[0] if plans else {"PlanId": PlanId}
        return jsonify(updated), 200

    except pymysql.err.IntegrityError as e:
        conn.rollback()
        return jsonify({"error": "Update failed (FK/constraints).", "detail": str(e)}), 400
    except Exception as e:
        conn.rollback()
        current_app.logger.exception("update_event_resources failed")
        return jsonify({"error": "Internal error", "detail": str(e)}), 500