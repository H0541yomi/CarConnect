from backend.Utils.ISOToSQL import date_to_formatted_datetime
from flask import Blueprint, request, jsonify, make_response, current_app, url_for
from mysql.connector import Error
from backend.db_connection import db 
from backend.Utils.UserStatus import is_moderator, is_comment_author, is_post_author  


posts = Blueprint("posts", __name__)

# Get a list of posts, filterable with params (Moderator story 3, Advertiser story 2, User story 2/4)
# Optional params: Title, EventName, CommunityName, PostedAfter@posts.route("/", methods=["GET"])
# PASSED
@posts.route("/", methods=["GET"])
def get_posts():
    try:
        cursor = db.get_db().cursor()
        
        query = """
        SELECT *
        FROM Post JOIN Event ON Post.EventID = Event.EventID
        JOIN Community ON Post.CommunityID = Community.CommunityID
        WHERE Deleted = FALSE
        """
        
        filters = []
        for param in ["Title", "EventName", "CommunityName"]:
            value = request.args.get(param)
            if value:
                query += f" AND {param} = %s"
                filters.append(value)
        
        posted_after = request.args.get("PostedAfter")
        if posted_after:
            formatted_datetime = date_to_formatted_datetime(posted_after)
            query += " AND Post.CreatedAt > %s"
            filters.append(formatted_datetime)

        query += " ORDER BY Post.CreatedAt DESC"

        cursor.execute(query)
        posts = cursor.fetchall()
        cursor.close()
        return jsonify({"posts": posts}), 200

    except Error as e:
        return jsonify({"error": str(e)}), 500
# Create a post (Moderator story 2, Advertiser story 1, User story 1, Event organizer story 3/5)
@posts.route("/", methods=["POST"])
def create_post():

    # Creates a new Post.
    # Expected JSON body:
    # {
    #   "AuthorID": 1,                  # required
    #   "Title": "Hello",               # required (<= 128 chars)
    #   "Body": "text...",              # required
    #   "AdvertiserID": 2,              # optional
    #   "EventID": 3,                   # optional
    #   "CommunityID": 4,               # optional
    #   "Likes": 0,                     # optional, default 0
    #   "Dislikes": 0,                  # optional, default 0
    #   "Deleted": false,               # optional, default false
    #   "Flagged": false,               # optional, default false
    #   "Created_At": "2025-08-12 10:30:00"  # optional; if omitted uses NOW()
    # }
    
    data = request.get_json(silent=True) or {}

    # 1) Validate required fields
    required = ["AuthorID", "Title", "Body"]
    missing = [k for k in required if data.get(k) is None]
    if missing:
        return jsonify({"error": f"Missing required field(s): {', '.join(missing)}"}), 400

    # 2) Pull values + defaults
    author_id     = data["AuthorID"]
    title         = data["Title"]
    body          = data["Body"]
    advertiser_id = data.get("AdvertiserID")
    event_id      = data.get("EventID")
    community_id  = data.get("CommunityID")
    likes         = data.get("Likes", 0)
    dislikes      = data.get("Dislikes", 0)
    deleted       = bool(data.get("Deleted", False))
    flagged       = bool(data.get("Flagged", False))
    createdat    =  data.get("CreatedAt")  

    createdat_formatted = date_to_formatted_datetime(createdat)

    try:
        conn = db.get_db()
        cur = conn.cursor()

        # 3) Parameterized INSERT (safe against SQL injection)
        sql = """
            INSERT INTO Post
                (AuthorID, AdvertiserID, EventID, CommunityID,
                 Likes, Dislikes, Title, Body, CreatedAt, Deleted, Flagged)
            VALUES
                (%s, %s, %s, %s,
                 %s, %s, %s, %s,
                 COALESCE(%s, NOW()), %s, %s)
        """
        cur.execute(
            sql,
            (
                author_id, advertiser_id, event_id, community_id,
                likes, dislikes, title, body,
                createdat_formatted, deleted, flagged,
            ),
        )
        conn.commit()
        new_id = cur.lastrowid

        resp = make_response(jsonify({"PostID": new_id}), 201)
        # If you have a GET /posts/<post_id> route, set Location header:
        # resp.headers["Location"] = url_for("posts.get_post", post_id=new_id, _external=True)
        cur.close()
        return resp

    except Error as e:
        current_app.logger.exception("POST /posts failed")
        return jsonify({"error": str(e)}), 500

# Get information on a specific post (Advertiser story 2)
# Optional param: AnalyticsAfter
@posts.route("/<int:post_id>", methods=["GET"])
def get_post(post_id):
    try:
        cursor = db.get_db().cursor()
        
        basic_info_query = """
        SELECT * FROM Post WHERE PostId = %s
        """
        analytics_query = """
        SELECT * FROM Post_Analytics WHERE PostId = %s
        """
        analytics_after = request.args.get("AnalyticsAfter")
        if analytics_after:
            analytics_query += " AND Timestamp > %s"
            formatted_datetime = date_to_formatted_datetime(analytics_after)
            
        cursor.execute(basic_info_query, (post_id,))
        basic_info = cursor.fetchone()
        cursor.execute(analytics_query, (post_id, formatted_datetime))
        analytics_info = cursor.fetchall()
        
        cursor.close()
        return jsonify({"PostInfo": basic_info, "Analytics": analytics_info}), 200
    except Error as e:
        return jsonify({"error": str(e)}), 500

# Update a post, or like/dislike it
# Required fields: Action (like, dislike, update), UserId (AdvertiserId can be a substitute for update action)
# When updating a post, you must provide UserId and at least 1 field to be updated.
@posts.route("/<int:post_id>", methods=["PUT"])
def update_post(post_id):
    try:
        cursor = db.get_db().cursor()
        data = request.get_json()
        
        action = data.get("Action")
        if not action:
            return jsonify({"error": "Action is required"}), 400
        if action not in ["like", "dislike", "update"]:
            return jsonify({"error": "Invalid action. Must be 'like', 'dislike', or 'update'."}), 400

        user_id = data.get("UserId")
        
        if action == "update":
            advertiser_id = data.get("AdvertiserId")
            if not user_id and not advertiser_id:
                return jsonify({"error": "UserId or AdvertiserId is required for update action"}), 400
            
            # Verify that user can edit this post
            can_update = is_post_author(user_id, advertiser_id, post_id) or is_moderator(user_id)
            if not can_update:
                return jsonify({"error": "User is not authorized to update this post"}), 403
            
            # Getting old data, then updating text fields of post
            cursor.execute("SELECT * FROM Post WHERE PostId = %s", (post_id,))
            old_data = cursor.fetchone()

            event_id = data.get("EventId") or old_data["EventId"]
            community_id = data.get("CommunityId") or old_data["CommunityId"]
            title = data.get("Title") or old_data["Title"]
            body = data.get("Body") or old_data["Body"]

            cursor.execute("""
            UPDATE Post SET EventId = %s, CommunityId = %s, Title = %s, Body = %s
            WHERE PostId = %s
            """, (event_id, community_id, title, body, post_id))
            db.get_db().commit()
            cursor.close()
            return jsonify({"status": "Post updated"}), 200
        
        elif action == "like" or action == "dislike":
            sql_action = "Liked" if action == "like" else "Disliked"
            cursor.execute("SELECT %s FROM Post_Meta WHERE UserId = %s AND PostId = %s", (sql_action, user_id, post_id))
            action_status = cursor.fetchone()
            if action_status:
                cursor.execute("UPDATE Post_Meta SET %s = FALSE WHERE UserId = %s AND PostId = %s", (sql_action, user_id, post_id))
                cursor.execute("UPDATE Post SET %s = GREATEST(%s - 1, 0) WHERE PostId = %s", (sql_action, sql_action, post_id))
            elif action_status is None:
                cursor.execute("INSERT INTO Post_Meta (UserId, PostId, %s) VALUES (%s, %s, TRUE)", (sql_action, user_id, post_id))
                cursor.execute("UPDATE Post SET %s = %s + 1 WHERE PostId = %s", (sql_action, sql_action, post_id))
            else:
                cursor.execute("UPDATE Post_Meta SET %s = TRUE WHERE UserId = %s AND PostId = %s", (sql_action, user_id, post_id))
                cursor.execute("UPDATE Post SET %s = %s + 1 WHERE PostId = %s", (sql_action, sql_action, post_id))
            db.get_db().commit()
            cursor.close()
            return jsonify({"status": "%s toggled" % action}), 200
        else:
            return jsonify({"error": "Invalid action, should not have reached this point!"}), 501
    except Error as e:
        return jsonify({"error": str(e)}), 500

# Mark a post as deleted or flagged (Moderator story 1/3)
# Required params: Either UserId or BotId
@posts.route("/<int:post_id>", methods=["DELETE"])
def delete_post(post_id):
    try:
        cursor = db.get_db().cursor()
        data = request.get_json()

        bot_id = data.get("BotId")
        user_id = data.get("UserId")
        
        # Bot flag action
        if bot_id:
            # Checking for bot existence
            cursor.execute("SELECT * FROM Bot WHERE BotId = %s", (bot_id,))
            if not cursor.fetchone():
                return jsonify({"error": "Bot not found, cannot flag post!"}), 404
            
            # If the bot exists, then flag the post
            cursor.execute("INSERT INTO Bot_Flags_Post (BotId, PostId) VALUES (%s, %s)", (bot_id, post_id))
            db.get_db().commit()

            cursor.execute("UPDATE Post SET Flagged = TRUE WHERE PostId = %s", (post_id,))
            db.get_db().commit()
            
        # Moderator/User delete action
        elif user_id:
            # Verify that user is a moderator
            moderator = is_moderator(user_id)

            # Or verify if the user is the author
            author = is_comment_author(user_id, post_id)

            if not moderator and not author:
                return jsonify({"error": "User is not authorized to delete this post"}), 403

            cursor.execute("UPDATE Post SET Deleted = TRUE WHERE PostId = %s", (post_id,))
            db.get_db().commit()
            
            if moderator:
                cursor.execute("INSERT INTO Moderator_Deletes_Post (UserId, PostId) VALUES (%s, %s)", (user_id, post_id))
                db.get_db().commit()

            return jsonify({"status": "Post deleted"}), 200
            
        else:
            return jsonify({"error": "Pass in a user id or bot id"}), 400
    except Error as e:
        return jsonify({"error": str(e)}), 500
        






# Comments routes start here

# Get a list of comments on a post (Moderator story 4, User story 1)
@posts.route("/<int:post_id>/comments", methods=["GET"])
def get_comments(post_id):
    try:
        cursor = db.get_db().cursor()
        cursor.execute("SELECT * FROM Comment WHERE PostID = %s AND Deleted = FALSE ORDER BY Likes DESC", (post_id,))
        comments = cursor.fetchall()
        cursor.close()
        return jsonify(comments), 200
    except Error as e:
        return jsonify({"error": str(e)}), 500

# Comment on a post (User story 1)
# Required params: UserId, Body
@posts.route("/<int:post_id>/comments", methods=["POST"])
def create_comment(post_id):
    try:
        cursor = db.get_db().cursor()
        data = request.get_json()

        author_id = data.get("UserId")
        body = data.get("Body")
        
        # Checking required fields
        if not author_id or not body:
            return jsonify({"error": "Check required fields: UserId, Body"}), 400

        cursor.execute(
            "INSERT INTO Comment (PostID, UserID, Body) VALUES (%s, %s, %s)",
            (post_id, author_id, body)
        )
        db.get_db().commit()
        cursor.close()
        return jsonify({"status": "Comment created"}), 201
    except Error as e:
        return jsonify({"error": str(e)}), 500

# Get info on a specific comment
@posts.route("/<int:post_id>/comments/<int:comment_id>", methods=["GET"])
def get_comment(post_id, comment_id):
    try:
        cursor = db.get_db().cursor()
        cursor.execute("SELECT * FROM Comment WHERE PostID = %s AND CommentID = %s AND Deleted = FALSE", (post_id, comment_id))
        comment = cursor.fetchone()
        cursor.close()
        if comment:
            return jsonify(comment), 200
        else:
            return jsonify({"error": "Comment not found"}), 404
    except Error as e:
        return jsonify({"error": str(e)}), 500

# Update a comment (edit body, like/dislike) (User story 1)
# Required params: UserId
# Use booleans when passing in the following optional params: Like, Dislike
@posts.route("/<int:post_id>/comments/<int:comment_id>", methods=["PUT"])
def update_comment(post_id, comment_id):
    try:
        cursor = db.get_db().cursor()
        data = request.get_json()
        
        user_id = data.get("UserId")
        
        # Verifying params
        if not user_id:
            return jsonify({"error": "UserId is required"}), 400
        
        new_body = data.get("Body")
        like = data.get("Like") # boolean
        dislike = data.get("Dislike") # boolean

        # User updates body action
        if new_body:
            author = is_comment_author(user_id, comment_id)
            if not author:
                return jsonify({"error": "User is not authorized to update this comment"}), 403

            cursor.execute("UPDATE Comment SET Body = %s WHERE CommentId = %s", (new_body, comment_id))
            db.get_db().commit()
            cursor.close()
            return jsonify({"status": "Comment updated"}), 200

        # User liking actions
        if like and dislike:
            return jsonify({"error": "Cannot like and dislike at the same time"}), 400
        if like or dislike: 
            sql_action = "Liked" if like else "Disliked"
            cursor.execute("SELECT %s FROM Comment_Meta WHERE UserId = %s AND CommentId = %s", (sql_action, user_id, comment_id))
            action_status = cursor.fetchone()
            
            if action_status:
                cursor.execute("UPDATE Comment_Meta SET %s = FALSE WHERE UserId = %s AND CommentId = %s", (sql_action, user_id, comment_id))
                cursor.execute("UPDATE Comment SET %s = GREATEST(%s - 1, 0) WHERE CommentId = %s", (sql_action, sql_action, comment_id))
            elif action_status is None:
                cursor.execute("INSERT INTO Comment_Meta (UserId, CommentId, %s) VALUES (%s, %s, TRUE)", (sql_action, user_id, comment_id))
                cursor.execute("UPDATE Comment SET %s = %s + 1 WHERE CommentId = %s", (sql_action, sql_action, comment_id))
            else:
                cursor.execute("UPDATE Comment_Meta SET %s = TRUE WHERE UserId = %s AND CommentId = %s", (sql_action, user_id, comment_id))
                cursor.execute("UPDATE Comment SET %s = %s + 1 WHERE CommentId = %s", (sql_action, sql_action, comment_id))
            db.get_db().commit()
            cursor.close()
            return jsonify({"status": "%s toggled on comment" % sql_action}), 200

        return jsonify({"error": "No action taken"}), 400
    except Error as e:
        return jsonify({"error": str(e)}), 500

# Mark a comment as deleted or flagged (Moderator story 1/3, User story 1)
# Required params: Either BotId or UserId
@posts.route("/<int:post_id>/comments/<int:comment_id>", methods=["DELETE"])
def delete_comment(post_id, comment_id):
    try:
        cursor = db.get_db().cursor()
        data = request.get_json()

        bot_id = data.get("BotId")
        user_id = data.get("UserId")
        
        # Bot flag action
        if bot_id:
            # Checking for bot existence
            cursor.execute("SELECT * FROM Bot WHERE BotId = %s", (bot_id,))
            if not cursor.fetchone():
                return jsonify({"error": "Bot not found, cannot flag post!"}), 404
            
            # If the bot exists, then flag the post
            cursor.execute("INSERT INTO Bot_Flags_Comment (BotId, CommentId) VALUES (%s, %s)", (bot_id, comment_id))
            db.get_db().commit()

            cursor.execute("UPDATE Comment SET Flagged = TRUE WHERE CommentId = %s", (comment_id,))
            db.get_db().commit()
            
        # Moderator/User delete action
        elif user_id:
            # Verify that user is a moderator
            moderator = is_moderator(user_id)

            # Or verify if the user is the author
            author = is_comment_author(user_id, comment_id)

            if not moderator and not author:
                return jsonify({"error": "User is not authorized to delete this comment"}), 403

            cursor.execute("UPDATE Comment SET Deleted = TRUE WHERE CommentId = %s", (comment_id,))
            db.get_db().commit()
            
            if moderator:
                cursor.execute("INSERT INTO Moderator_Deletes_Comment (UserId, CommentId) VALUES (%s, %s)", (user_id, comment_id))
                db.get_db().commit()

            return jsonify({"status": "Comment deleted"}), 200
            
        else:
            return jsonify({"error": "Pass in a user id or bot id"}), 400
    except Error as e:
        return jsonify({"error": str(e)}), 500