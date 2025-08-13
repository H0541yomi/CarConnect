from mysql.connector import Error
from flask import Blueprint, jsonify
from backend.db_connection import db

users = Blueprint("users", __name__)

@users.route("/", methods=["GET"])
def get_users():
    return jsonify({"status": "api endpoint incomplete"}), 501

@users.route("/", methods=["POST"])
def create_user():
    return jsonify({"status": "api endpoint incomplete"}), 501

@users.route("/<int:user_id>", methods=["GET"])
def get_user(user_id):
    return jsonify({"status": "api endpoint incomplete"}), 501

# Verify users as event organizers (Moderator story 6)
@users.route("/<int:user_id>", methods=["PUT"])
def verify_user(user_id):
    try:
        cursor = db.get_db().cursor()

        query = """
        UPDATE Users
        SET Role = CONCAT(Role, 'Event Organizer')
        WHERE UserId = %s
        """
        
        cursor.execute(query, {user_id})
        db.get_db().commit()
        cursor.close()
        
        return jsonify(
            {"message": f"User {user_id} verified successfully"}
        )

    except Error as e:
        return jsonify({"error": str(e)}), 500

# Delete a user (Moderator story 3)
@users.route("/<int:user_id>", methods=["DELETE"])
def delete_user(user_id):
    try:
        cursor = db.get_db().cursor()
        
        query = """
        DELETE FROM Users
        WHERE UserId = %s
        """

        cursor.execute(query, {user_id})
        db.get_db().commit()
        
        users_deleted = cursor.rowcount
        
        cursor.close()

        if users_deleted == 0:
            return jsonify({"message": "Deleted user did not exist"}), 204
        else:
            # Else, there was 1 user deleted because UserId is a primary key
            return jsonify({"message": "User deleted successfully"}), 200
    
    except Error as e:
        return jsonify({"error": str(e)}), 500