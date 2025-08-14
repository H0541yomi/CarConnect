from flask import Blueprint, jsonify, request
from mysql.connector import Error
from backend.db_connection import db

communities = Blueprint("communities", __name__)

# Get a list of communities
# Optional params: Name, MinPosts, MaxPosts, CommunityId
@communities.route("/", methods=["GET"])
def get_communities():
    try:
        cursor = db.get_db().cursor()
        name = request.args.get("Name")
        min_posts = request.args.get("MinPosts")
        max_posts = request.args.get("MaxPosts")
        community_id = request.args.get("CommunityId")

        query = """
        SELECT c.CommunityId, c.OwnerId, c.ChatId, c.CreatedAt, c.Name, c.Description, COUNT(p.PostId) AS num_posts
        FROM Community AS c LEFT JOIN Post AS p ON p.CommunityId = c.CommunityId
        WHERE 1=1
        """
        params = []
        
        if name:
            query += " AND c.Name LIKE %s"
            params.append(f"%{name}%")

        if community_id:
            query += " AND c.CommunityId = %s"
            params.append(community_id)

        query += """ 
         GROUP BY c.CommunityId
        HAVING 1=1
        """ 
        
        if min_posts:
            query += " AND num_posts >= %s"
            params.append(min_posts)

        if max_posts:
            query += " AND num_posts <= %s"
            params.append(max_posts)

        cursor.execute(query, params)
        communities = cursor.fetchall()
        cursor.close()
        
        return jsonify({"communities": communities}), 200
    except Error as e:
        return jsonify({"error": str(e)}), 500

# Create a community (User story 5, Event organizer story 4)
# Required params: CreatorId, Name
@communities.route("/", methods=["POST"])
def create_community():
    try:
        data = request.get_json()
        cursor = db.get_db().cursor()

        creator_id = data.get("CreatorId")
        name = data.get("Name")
        
        # Verifying params
        if not creator_id:
            return jsonify({"error": "Missing field CreatorId"}), 400

        if not name:
            return jsonify({"error": "Missing field Name"}), 400

        description = data.get("description")
        
        # Creating group chat that corresponds to the community
        group_chat_query = """
        INSERT INTO Group_Chat (OwnerId, Name) VALUES (%s, %s)
        """
        group_chat_name = "Chat for " + name
        cursor.execute(group_chat_query, (creator_id, group_chat_name))
        db.get_db().commit()
        group_id = cursor.lastrowid

        # Creating community
        community_query = """
        INSERT INTO Community (OwnerId, ChatId, Name) VALUES (%s, %s, %s)
        """
        cursor.execute(community_query, (creator_id, group_id, name))
        db.get_db().commit()
        community_id = cursor.lastrowid
        cursor.close()

        return jsonify({"message": "Community created successfully", "CommunityId": community_id, "GroupId": group_id}), 201
    except Error as e:
        return jsonify({"error": str(e)}), 500

# Update community information (User story 5, Event organizer story 4)
@communities.route("/<int:community_id>", methods=["PUT"])
def update_community(community_id):
    try:
        data = request.get_json()
        cursor = db.get_db().cursor()

        name = data.get("Name")
        description = data.get("Description")
        
        updated_fields = []
        params = []

        if name:
            updated_fields.append("Name = %s")
            params.append(name)

        if description:
            updated_fields.append("Description = %s")
            params.append(description)
            
        if not updated_fields:
            return jsonify({"error": "Pass in at least one field to update!"}), 400
            
        set_clause = ", ".join(updated_fields)

        query = "UPDATE Community SET " + set_clause + " WHERE CommunityId = %s"
        params.append(community_id)

        cursor.execute(query, params)
        db.get_db().commit()
        cursor.close()

        return jsonify({"message": "Community updated successfully"}), 200
    except Error as e:
        return jsonify({"error": str(e)}), 500

# Delete a community (User story 5, Event organizer story 4)
@communities.route("/<int:community_id>", methods=["DELETE"])
def delete_community(community_id):
    try:
        cursor = db.get_db().cursor()
        query = "DELETE FROM Community WHERE CommunityId = %s"
        cursor.execute(query, (community_id,))
        db.get_db().commit()
        cursor.close()
        
        return jsonify({"message": "Community deleted successfully"}), 200
    except Error as e:
        return jsonify({"error": str(e)}), 500