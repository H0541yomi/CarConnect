from mysql.connector import Error
from flask import Blueprint, jsonify, request
from backend.db_connection import db

group_chats = Blueprint("group_chats", __name__)

# Get group chat information (Moderator story 4/5, User story 3, Event organizer story 3)
@group_chats.route("/<int:group_id>", methods=["GET"])
def get_group_chat(group_id):
    try:
        cursor = db.get_db().cursor()
        
        cursor.execute("SELECT * FROM Group_Chat WHERE GroupId = %s", (group_id,))
        
        group_chat = cursor.fetchone()
        cursor.close()
        if group_chat:
            return jsonify({"group_chat": group_chat}), 200
        else:
            return jsonify({"error": "Group chat not found"}), 404
    except Error as e:
        return jsonify({"error": str(e)}), 500

# Edit group chat information (Moderator story 4/5, User story 3, Event organizer story 3)
@group_chats.route("/<int:group_id>", methods=["PUT"])
def update_group_chat(group_id):
    try:
        cursor = db.get_db().cursor()
        data = request.get_json()
        
        cursor.execute("UPDATE Group_Chat SET Name = %s WHERE GroupId = %s",
                       (data.get("Name"), group_id))
        db.get_db().commit()
        cursor.close()
        
        return jsonify({"status": "Group chat updated"}), 200
    except Error as e:
        return jsonify({"error": str(e)}), 500

# Delete group chat (Moderator story 4/5, User story 3, Event organizer story 3)
@group_chats.route("/<int:group_id>", methods=["DELETE"])
def delete_group_chat(group_id):
    try:
        cursor = db.get_db().cursor()
        
        cursor.execute("DELETE FROM Group_Chat WHERE GroupId = %s", (group_id,))
        
        db.get_db().commit()
        cursor.close()
        
        return jsonify({"status": "Group chat deleted"}), 200
    except Error as e:
        return jsonify({"error": str(e)}), 500