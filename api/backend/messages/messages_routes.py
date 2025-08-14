from flask import Blueprint, jsonify, request
from mysql.connector import Error
from backend.db_connection import db

messages = Blueprint("messages", __name__)

# Get messages in a group chat (Moderator story 4/5, User story 3, Event organizer story 3)
@messages.route("/<int:group_id>", methods=["GET"])
def get_messages(group_id):
    try:
        cursor = db.get_db().cursor()
        
        cursor.execute("SELECT * FROM Message WHERE GroupId = %s", (group_id,))
        
        messages = cursor.fetchall()
        cursor.close()
        return jsonify({"messages": messages}), 200
    except Error as e:
        return jsonify({"error": str(e)}), 500

# Send messages in a group chat (Moderator story 4/5, User story 3, Event organizer story 3)
@messages.route("/<int:group_id>", methods=["POST"])
def create_message(group_id):
    try:
        cursor = db.get_db().cursor()
        data = request.get_json()
        
        cursor.execute("INSERT INTO Message (AuthorId, GroupId, Body) VALUES (%s, %s, %s)",
                       (data.get("AuthorId"), group_id, data.get("Body")))

        db.get_db().commit()
        cursor.close()
        return jsonify({"status": "Message sent"}), 201
    except Error as e:
        return jsonify({"error": str(e)}), 500

# Edit messages in a group chat (Moderator story 4/5, User story 3, Event organizer story 3)
@messages.route("/<int:message_id>", methods=["PUT"])
def edit_message(message_id):
    try:
        cursor = db.get_db().cursor()
        data = request.get_json()
        
        cursor.execute("UPDATE Message SET Body = %s WHERE MessageId = %s",
                       (data.get("Body"), message_id))
        
        db.get_db().commit()
        cursor.close()
        return jsonify({"status": "Message updated"}), 200
    except Error as e:
        return jsonify({"error": str(e)}), 500

# Delete a message (Moderator story 4/5, User story 3, Event organizer story 3)
@messages.route("<int:message_id>", methods=["DELETE"])
def delete_message(message_id):
    try:
        cursor = db.get_db().cursor()
        
        cursor.execute("DELETE FROM Message WHERE MessageId = %s", (message_id,))
        
        db.get_db().commit()
        cursor.close()
        return jsonify({"status": "Message deleted"}), 200
    except Error as e:
        return jsonify({"error": str(e)}), 500