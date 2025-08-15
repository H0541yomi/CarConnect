from flask import Blueprint, jsonify, request
from mysql.connector import Error
from backend.db_connection import db

rsvps = Blueprint("rsvps", __name__)

# Get RSVPs for an event (Event organizer story 2)
# Optional params: Status, SubmittedAfter
@rsvps.route("/<int:event_id>", methods=["GET"])
def get_rsvps(event_id):
    try:
        cursor = db.get_db().cursor()
        query = """
        SELECT * FROM RSVP JOIN Event_RSVPs ON RSVP.RsvpId = Event_RSVPs.RsvpId
        WHERE Event_RSVPs.EventId = %s
        """

        params = [event_id]
        status = request.args.get("Status")
        submitted_after = request.args.get("SubmittedAfter")
    
        if status:
            query += " AND RSVP.Status = %s"
            params.append(status)
        if submitted_after:
            query += " AND RSVP.SubmittedAt > %s"
            params.append(submitted_after)

        cursor.execute(query, params)
        rsvps = cursor.fetchall()
        cursor.close()
        return jsonify({"RSVPs": rsvps}), 200
    except Error as e:
        return jsonify({"error": str(e)}), 500

# Create a new RSVP
# Required params: UserId, Status
@rsvps.route("/<int:event_id>", methods=["POST"])
def create_rsvp(event_id):
    try:
        cursor = db.get_db().cursor()
        
        user_id = request.json.get("UserId")
        status = request.json.get("Status")

        if not user_id or not status:
            return jsonify({"error": "Missing required parameters. Check for UserId and Status"}), 400

        cursor.execute("INSERT INTO RSVP (UserId, Status) VALUES (%s, %s)", (user_id, status))
        db.get_db().commit()
        rsvp_id = cursor.lastrowid

        cursor.execute("INSERT INTO Event_RSVPs (RsvpId, EventId) VALUES (%s, %s)", (rsvp_id, event_id))
        db.get_db().commit()

        cursor.close()
        return jsonify({"message": "RSVP created successfully"}), 201
    except Error as e:
        return jsonify({"error": str(e)}), 500