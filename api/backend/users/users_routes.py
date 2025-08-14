from mysql.connector import Error
from flask import Blueprint, jsonify, request
from backend.db_connection import db

users = Blueprint("users", __name__)

# Get a list of users. (Optional: filter users based on parameters) (User story 2)
# Optional params: Username, City, State, Country, Role
@users.route("/", methods=["GET"])
def get_users():
    try:
        cursor = db.get_db().cursor()
        
        filter_params = request.get_json()
        username = filter_params.get("Username")
        city = filter_params.get("City")
        state = filter_params.get("State")
        country = filter_params.get("Country")
        role = filter_params.get("Role")

        query = "SELECT UserId, Username FROM Users WHERE 1=1"
        params = []

        if username:
            query += " AND Username = %s"
            params.append(username)
        if city:
            query += " AND City = %s"
            params.append(city)
        if state:
            query += " AND State = %s"
            params.append(state)
        if country:
            query += " AND Country = %s"
            params.append(country)
        if role:
            query += " AND Role = %s"
            params.append(role)

        cursor.execute(query, params)
        users = cursor.fetchall()
        cursor.close()

        return jsonify({"users": users}), 200

    except Error as e:
        return jsonify({"error": str(e)}), 500


# Get detailed information about a specific user (User story 2, 6)
@users.route("/<int:user_id>", methods=["GET"])
def get_user(user_id):
    try:
        cursor = db.get_db().cursor()
        
        profile_query = """
        SELECT * FROM Users
        WHERE UserId = %s
        """
        cars_list_query = """
        SELECT * FROM Cars
        JOIN Car_Build ON Car_Build.CarId = Cars.CarId
        JOIN Car_Meta ON Car_Meta.CarId = Cars.CarId
        WHERE OwnerId = %s
        """
        follower_count_query = """
        SELECT COUNT(*) AS follower_count
        FROM Follower_Followee
        WHERE FolloweeId = %s
        """
        followee_count_query = """
        SELECT COUNT(*) AS followee_count
        FROM Follower_Followee
        WHERE FollowerId = %s
        """
        
        cursor.execute(profile_query, (user_id,))
        profile = cursor.fetchall()[0]
        
        cursor.execute(cars_list_query, (user_id,))
        cars_list = cursor.fetchall()
        
        cursor.execute(follower_count_query, (user_id,))
        follower_count = cursor.fetchone()["follower_count"]
        cursor.execute(followee_count_query, (user_id,))
        followee_count = cursor.fetchone()["followee_count"]

        response = {
            **profile,
            "follower_count": follower_count,
            "followee_count": followee_count,
            "car_info": cars_list
        }

        return jsonify(response), 200
    except Error as e:
        return jsonify({"error": str(e)}), 500

# Create a new user
# Required params: Username
# Optional params: FirstName, MiddleName, LastName, Email, BirthDate, City, State, Country, Gender, Bio, ProfilePictureUrl, Role
@users.route("/", methods=["POST"])
def create_user():
    try:
        data = request.get_json()

        if "Username" not in data:
            return jsonify({"error": "Missing required parameter: Username"}), 400
        
        # Use .get() method to safely get values (returns None if not present)
        FirstName = data.get("FirstName")
        MiddleName = data.get("MiddleName") 
        LastName = data.get("LastName")
        Email = data.get("Email")
        BirthDate = data.get("BirthDate")
        City = data.get("City")
        State = data.get("State")
        Country = data.get("Country")
        Gender = data.get("Gender")
        Bio = data.get("Bio")
        ProfilePictureUrl = data.get("ProfilePictureUrl")
        Role = data.get("Role")
        
        cursor = db.get_db().cursor()
        
        # Insert all fields (None values will be inserted as NULL in SQL)
        query = """
        INSERT INTO Users (Username, FirstName, MiddleName, LastName, Email, 
                          BirthDate, City, State, Country, Gender, Bio, 
                          ProfilePictureUrl, Role) 
        VALUES (%s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s)
        """

        cursor.execute(query, (data['Username'], FirstName, MiddleName, LastName, Email, BirthDate, City, State, Country, Gender, Bio, ProfilePictureUrl, Role))
        db.get_db().commit()
        user_id = cursor.lastrowid
        cursor.close()

        return jsonify({"message": "User created successfully", "user_id": user_id}), 201

    except Error as e:
        return jsonify({"error": str(e)}), 500

# Verify users as event organizers (Moderator story 6)
# Required param: UserId (for moderator verification)
@users.route("/<int:user_id>", methods=["PUT"])
def verify_user(user_id):
    try:
        cursor = db.get_db().cursor()

        moderator_check_query = """
        SELECT Role 
        FROM Users 
        WHERE UserId = %s
        AND FIND_IN_SET('Moderator', Role) > 0
        """
        cursor.execute(moderator_check_query, (user_id,))
        is_moderator = cursor.fetchone() is not None

        if not is_moderator:
            cursor.close()
            return jsonify({"error": "User is not a moderator"}), 403

        query = """
        UPDATE Users
        SET Role = CONCAT(Role, 'Event Organizer')
        WHERE UserId = %s
        """
        
        cursor.execute(query, (user_id,))
        db.get_db().commit()
        
        if cursor.rowcount == 0:
            cursor.close()
            return jsonify({"error": "User not found"}), 404
        
        cursor.close()
        
        return jsonify(
            {"message": f"User {user_id} verified successfully"}, 200
        )

    except Error as e:
        return jsonify({"error": str(e)}), 500
    
# Update user profile (User story 6)
@users.route("/<int:user_id>/profile", methods=["PUT"])
def edit_profile(user_id):
    try:
        data = request.get_json()
        cursor = db.get_db().cursor()

        # Update user information
        query = """
        UPDATE Users
        SET FirstName = %s, MiddleName = %s, LastName = %s, Email = %s,
            BirthDate = %s, City = %s, State = %s, Country = %s,
            Gender = %s, Bio = %s, ProfilePictureUrl = %s, Role = %s
        WHERE UserId = %s
        """

        cursor.execute(query, (
            data.get("FirstName"),
            data.get("MiddleName"),
            data.get("LastName"),
            data.get("Email"),
            data.get("BirthDate"),
            data.get("City"),
            data.get("State"),
            data.get("Country"),
            data.get("Gender"),
            data.get("Bio"),
            data.get("ProfilePictureUrl"),
            data.get("Role"),
            user_id
        ))
        db.get_db().commit()
        cursor.close()

        if cursor.rowcount == 0:
            return jsonify({"error": "User not found"}), 404

        return jsonify({"message": "User profile updated successfully"}), 200

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

        cursor.execute(query, (user_id,))
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