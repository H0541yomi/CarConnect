from flask import Blueprint, jsonify, request
from mysql.connector import Error
from backend.db_connection import db

follows = Blueprint("follows", __name__)

# Get following/followers list, specify with params (User story 3)
@follows.route("/<int:user_id>", methods=["GET"])
def get_following_info(user_id):
    try:
        cursor = db.get_db().cursor()

        followers_query = """
        SELECT UserId, Username
        FROM Users JOIN Follower_Followee ON Users.UserId = Follower_Followee.FolloweeId
        WHERE UserId = %s
        """
        following_query = """
        SELECT UserId, Username
        FROM Users JOIN Follower_Followee ON Users.UserId = Follower_Followee.FollowerId
        WHERE UserId = %s
        """

        cursor.execute(followers_query, (user_id,))
        followers = cursor.fetchall()
        cursor.execute(following_query, (user_id,))
        following = cursor.fetchall()

        return jsonify({"followers": followers, "following": following}), 200

    except Error as e:
        return jsonify({"error": str(e)}), 500

# Follow a user (User story 3)
@follows.route("/<int:user_id>/<int:followed_user_id>", methods=["POST"])
def follow_user(user_id, followed_user_id):
    try:
        cursor = db.get_db().cursor()
        cursor.execute("INSERT INTO Follower_Followee (FollowerId, FolloweeId) VALUES (%s, %s)", (user_id, followed_user_id))
        db.get_db().commit()
        return jsonify({"message": f"successfully followed user {followed_user_id}"}), 201
    except Error as e:
        return jsonify({"error": str(e)}), 500

# Unfollow a user (User story 3)
@follows.route("/<int:user_id>/<int:followed_user_id>", methods=["DELETE"])
def unfollow_user(user_id, followed_user_id):
    try:
        cursor = db.get_db().cursor()
        cursor.execute("DELETE FROM Follower_Followee WHERE FollowerId = %s AND FolloweeId = %s", (user_id, followed_user_id))
        db.get_db().commit()
        return jsonify({"message": f"successfully unfollowed user {followed_user_id}"}), 200
    except Error as e:
        return jsonify({"error": str(e)}), 500