from flask import Blueprint, jsonify, request
from backend.db_connection import db
from mysql.connector import Error
from flask import current_app

bots = Blueprint("bots", __name__)

# Get a list of all bots
# Optional Parameters for filtering: UserId, Name
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
        
        return jsonify(bots, 200)
        
    except Error as e:
        return jsonify({"error": str(e)}), 500

# Create a new automod bot (Moderator story 1)
# Required Fields: BotName, UserId, Scripts
@bots.route("/", methods=["POST"])
def create_bot():
    try:
        data = request.get_json()
        
        # Validate required fields
        required_fields = ["BotName", "UserId", "Scripts"]
        for field in required_fields:
            if field not in data:
                return jsonify({"error": f"Missing required field: {field}"}), 400

        # Inserting new bot

        cursor = db.get_db().cursor()

        bot_insert_query = """
        INSERT INTO Bot (Name, DevId)
        VALUES (%s, %s)
        """
        
        cursor.execute(
            bot_insert_query,
            (
                data["BotName"],
                data["UserId"],
            )
        )
        db.get_db().commit()
        
        # Inserting the bot's scripts with foreign keys that all point towards the new bot

        scripts_insert_query = """
        INSERT INTO BotScripts (BotId, Script)
        VALUES (%s, %s)
        """
        
        new_bot_id = cursor.lastrowid

        for script in data["Scripts"]:
            cursor.execute(
                scripts_insert_query,
                {
                    new_bot_id,
                    script
                }
            )
            db.get_db().commit()
        
        cursor.close()

        return (
            jsonify({"message": "bot created successfully", "BotId": new_bot_id, "ScriptsLoaded": len(data["Scripts"])}),
            201
        )

    except Error as e:
        return jsonify({"error": str(e)}), 500

@bots.route("/<int:bot_id>", methods=["GET"])
def get_bot(bot_id):
    return jsonify({"status": "api endpoint incomplete"}), 501

@bots.route("/<int:bot_id>", methods=["POST"])
def create_bot_script(bot_id):
    return jsonify({"status": "api endpoint incomplete"}), 501

@bots.route("/<int:bot_id>", methods=["PUT"])
def update_bot(bot_id):
    return jsonify({"status": "api endpoint incomplete"}), 501

@bots.route("/<int:bot_id>", methods=["DELETE"])
def delete_bot(bot_id):
    return jsonify({"status": "api endpoint incomplete"}), 501

@bots.route("/<int:bot_id>/<int:script_id>", methods=["GET"])
def get_bot_script(bot_id, script_id):
    return jsonify({"status": "api endpoint incomplete"}), 501

@bots.route("/<int:bot_id>/<int:script_id>", methods=["PUT"])
def edit_bot_script(bot_id, script_id):
    return jsonify({"status": "api endpoint incomplete"}), 501

@bots.route("/<int:bot_id>/<int:script_id>", methods=["DELETE"])
def delete_bot_script(bot_id, script_id):
    return jsonify({"status": "api endpoint incomplete"}), 501   