from flask import Blueprint, request, jsonify, make_response, current_app, url_for
from backend.db_connection import db  # same helper you used elsewhere


posts = Blueprint("posts", __name__)

@posts.route("/", methods=["GET"])
def get_posts():
    return jsonify({"status": "api endpoint incomplete"}), 501


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
    createdat    = data.get("CreatedAt")  # optional string 'YYYY-MM-DD HH:MM:SS'

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
                createdat, deleted, flagged,
            ),
        )
        conn.commit()
        new_id = cur.lastrowid

        resp = make_response(jsonify({"PostID": new_id}), 201)
        # If you have a GET /posts/<post_id> route, set Location header:
        # resp.headers["Location"] = url_for("posts.get_post", post_id=new_id, _external=True)
        return resp

    except Exception as e:
        current_app.logger.exception("POST /posts failed")
        return jsonify({"error": str(e)}), 500



@posts.route("/<int:post_id>", methods=["GET"])
def get_post(post_id):
    return jsonify({"status": "api endpoint incomplete"}), 501

@posts.route("/<int:post_id>", methods=["PUT"])
def update_post(post_id):
    return jsonify({"status": "api endpoint incomplete"}), 501

@posts.route("/<int:post_id>", methods=["DELETE"])
def delete_post(post_id):
    return jsonify({"status": "api endpoint incomplete"}), 501