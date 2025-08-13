from copy import Error
from urllib import request
from backend.db_connection import db
from flask import Blueprint, jsonify

bots = Blueprint("bots", __name__)

@bots.route("/", methods=["GET"])
def get_bots():
    return jsonify({"status": "api endpoint incomplete"}), 501

@bots.route("/", methods=["POST"])
def create_bot():
    return jsonify({"status": "api endpoint incomplete"}), 501

# Create a new automod bot
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

        # Inserting the bot 

        bot_insert_query = """
        INSERT INTO Bot (Name, DevId)
        VALUES (%s, %s)
        """
        
        cursor.execute(
            bot_insert_query,
            {
                data["BotName"],
                data["UserId"]
            }
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