from flask import Blueprint, jsonify, request
from mysql.connector import Error
from backend.db_connection import db

post_analytics = Blueprint("post_analytics", __name__)

# Look at a list of post analytics for multiple posts (Advertiser story 2)
# Optional params for filtering: PostedAfter, AnalyticsAfter
@post_analytics.route("/", methods=["GET"])
def get_post_analytics():
    try:
        cursor = db.get_db().cursor()
        query = """SELECT a.AnalyticsId, a.Timestamp, a.PostId, a.Views, a.Clicks, a.CTR, a.CPC, a.Conversions, a.Impressions
        FROM Post_Analytics AS a JOIN Posts AS p ON a.PostId = p.PostId
        WHERE 1=1"""
        params = []

        posted_after = request.args.get("PostedAfter")
        analytics_after = request.args.get("AnalyticsAfter")

        if posted_after:
            query += " AND p.CreatedAt > %s"
            params.append(posted_after)
        if analytics_after:
            query += " AND a.Timestamp > %s"
            params.append(analytics_after)

        cursor.execute(query, params)
        analytics = cursor.fetchall()
        cursor.close()
        return jsonify({"PostAnalytics": analytics}), 200
    except Error as e:
        return jsonify({"error": str(e)}), 500

# Get detailed analytics for a single post (Advertiser story 2/6)
@post_analytics.route("/<int:post_id>", methods=["GET"])
def get_post_analytics_by_id(post_id):
    try:
        cursor = db.get_db().cursor()

        analytics_query = """
        SELECT * FROM Post_Analytics WHERE PostId = %s
        """
        country_demographics_query = """
        SELECT Count(UserId) AS ViewersFromCountry
        FROM Post JOIN Post_Meta ON Post.PostId = Post_Meta.PostId
        JOIN User ON Post_Meta.UserId = User.UserId
        WHERE Post.PostId = %s AND Clicked = TRUE
        GROUP BY Country
        """
        gender_demographics_query = """
        SELECT Count(UserId) AS ViewersFromGender
        FROM Post JOIN Post_Meta ON Post.PostId = Post_Meta.PostId
        JOIN User ON Post_Meta.UserId = User.UserId
        WHERE Post.PostId = %s AND Clicked = TRUE
        GROUP BY Gender
        """
        cursor.execute(analytics_query, (post_id,))
        analytics = cursor.fetchall()

        cursor.execute(country_demographics_query, (post_id,))
        country_demographics = cursor.fetchall()

        cursor.execute(gender_demographics_query, (post_id,))
        gender_demographics = cursor.fetchall()

        cursor.close()
        return jsonify({
            "PostAnalytics": analytics,
            "CountryDemographics": country_demographics,
            "GenderDemographics": gender_demographics,
        }), 200
    except Error as e:
        return jsonify({"error": str(e)}), 500