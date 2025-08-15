from flask import Blueprint, jsonify, request
from backend.db_connection import db
from mysql.connector import Error
from flask import current_app

bots = Blueprint("bots", __name__)

# Get a list of all bots
# Optional Parameters for filtering: UserId, Name
# PASSED
@bots.route("/", methods=["GET"])
def get_bots():
    try:
        UserId = request.args.get('UserId')
        Name = request.args.get('Name')

        cursor = db.get_db().cursor()
        query = """
        SELECT BotId, DevId, Name 
        FROM Bot
        WHERE 1=1
        """
        filters = []

        if UserId:
            query += " AND DevId = %s"
            filters.append(UserId)
        if Name:
            query += " AND Name LIKE %s"
            filters.append(f"%{Name}%")

        cursor.execute(
            query,
            filters
        )
        bots = cursor.fetchall()
        cursor.close()
        
        return jsonify(bots), 200
        
    except Error as e:
        return jsonify({"error": str(e)}), 500

# Create a new automod bot (Moderator story 1)
# PASSED
@bots.route("/", methods=["POST"])
def create_bot():
    try:
        cursor = db.get_db().cursor()
        data = request.get_json() or {}

        # Validating fields
        for field in ("BotName", "UserId", "Scripts"):
            if field not in data:
                return jsonify({"error": f"Missing required field: {field}"}), 400
        if not isinstance(data["Scripts"], (list, tuple)) or not data["Scripts"]:
            return jsonify({"error": "Scripts must be a non-empty list"}), 400

        cursor.execute("SELECT UserId FROM Users WHERE UserId = %s", (data["UserId"],))
        if cursor.fetchone() is None:
            cursor.close()
            return jsonify({"error": f"UserId {data['UserId']} does not exist"}), 400

        # Inserting bot
        cursor.execute(
            "INSERT INTO Bot (Name, DevId) VALUES (%s, %s)",
            (data["BotName"], data["UserId"])
        )
        new_bot_id = cursor.lastrowid
        db.get_db().commit()

        # Inserting scripts
        scripts_insert_query = "INSERT INTO Script (BotId, Script) VALUES (%s, %s)"
        script_rows = [(new_bot_id, s) for s in data["Scripts"]]
        cursor.executemany(scripts_insert_query, script_rows)
        db.get_db().commit()
        
        cursor.close()

        return jsonify({
            "message": "Bot created successfully",
            "BotId": new_bot_id,
            "ScriptsLoaded": len(script_rows)
        }), 201

    except Error as e:
        return jsonify({"error": str(e)}), 500

# Get info on a specific bot (Moderator story 1)
@bots.route("/<int:bot_id>", methods=["GET"])
def get_bot(bot_id):
    try:
        cursor = db.get_db().cursor()
        
        query = """
        SELECT *
        FROM Bot JOIN Script ON Bot.BotId = Script.BotId
        WHERE Bot.BotId = %s
        """
        cursor.execute(query, (bot_id,))
        bot_info = cursor.fetchall()
        cursor.close()

        if not bot_info:
            return jsonify({"error": "Bot not found"}), 404

        return jsonify(bot_info), 200

    except Error as e:
        return jsonify({"error": str(e)}), 500

# Add a new script to a bot (Moderator story 1)
# Required param: Scripts (array or string)
@bots.route("/<int:bot_id>", methods=["POST"])
def update_bot(bot_id):
    try:
        cursor = db.get_db().cursor()
        data = request.get_json() or {}

        scripts = data.get("Scripts")
        if not scripts:
            return jsonify({"error": "Missing required field: Scripts"}), 400

        if not isinstance(scripts, (list, tuple)):
            scripts = [scripts]

        # Inserting scripts
        scripts_insert_query = "INSERT INTO Script (BotId, Script) VALUES (%s, %s)"
        script_rows = [(bot_id, s) for s in scripts]
        cursor.executemany(scripts_insert_query, script_rows)
        db.get_db().commit()

        cursor.close()

        return jsonify({
            "message": "Scripts added successfully",
            "ScriptsLoaded": len(script_rows)
        }), 201

    except Error as e:
        return jsonify({"error": str(e)}), 500

# Edit a bot name (Moderator story 1)
# Required param: Name
@bots.route("/<int:bot_id>", methods=["PUT"])
def create_bot_script(bot_id):
    try:
        cursor = db.get_db().cursor()
        data = request.get_json() or {}
        
        new_name = data.get("Name")
        
        if not new_name: 
            return jsonify({"error": "Missing required field: Name"}), 400

        cursor.execute("UPDATE Bot SET Name = %s WHERE BotId = %s", (new_name, bot_id))
        db.get_db().commit()
        cursor.close()

        return jsonify({"message": "Bot name updated successfully"}), 200

    except Error as e:
        return jsonify({"error": str(e)}), 500

# Delete a bot (Moderator story 1)
@bots.route("/<int:bot_id>", methods=["DELETE"])
def delete_bot(bot_id):
    try:
        cursor = db.get_db().cursor()
        cursor.execute("DELETE FROM Bot WHERE BotId = %s", (bot_id,))
        db.get_db().commit()
        cursor.close()
        
        return jsonify({"message": "Bot deleted"}), 200
    except Error as e:
        return jsonify({"error": str(e)}), 500

# Read a specific script (Moderator story 1)
@bots.route("/<int:bot_id>/<int:script_id>", methods=["GET"])
def get_bot_script(bot_id, script_id):
    try:
        cursor = db.get_db().cursor()
        cursor.execute("SELECT * FROM Script WHERE BotId = %s AND ScriptId = %s", (bot_id, script_id))
        script_info = cursor.fetchone()
        cursor.close()

        if not script_info:
            return jsonify({"error": "Script not found"}), 404

        return jsonify(script_info), 200

    except Error as e:
        return jsonify({"error": str(e)}), 500

# Edit a specific script (Moderator story 1)
# Required params: Script
@bots.route("/<int:bot_id>/<int:script_id>", methods=["PUT"])
def edit_bot_script(bot_id, script_id):
    try:
        cursor = db.get_db().cursor()
        data = request.get_json() or {}

        script_content = data.get("Script")
        if not script_content:
            return jsonify({"error": "Missing required field: Script"}), 400

        cursor.execute("UPDATE Script SET Script = %s WHERE BotId = %s AND ScriptId = %s",
                       (script_content, bot_id, script_id))
        db.get_db().commit()
        cursor.close()

        return jsonify({"message": "Script updated successfully"}), 200

    except Error as e:
        return jsonify({"error": str(e)}), 500

# Delete a specific script (Moderator story 1)
@bots.route("/<int:bot_id>/<int:script_id>", methods=["DELETE"])
def delete_bot_script(bot_id, script_id):
    try:
        cursor = db.get_db().cursor()
        cursor.execute("DELETE FROM Script WHERE BotId = %s AND ScriptId = %s", (bot_id, script_id))
        db.get_db().commit()
        cursor.close()

        return jsonify({"message": "Script deleted successfully"}), 200

    except Error as e:
        return jsonify({"error": str(e)}), 500