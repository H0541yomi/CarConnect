from flask import Blueprint, jsonify

post_analytics = Blueprint("post_analytics", __name__)

@post_analytics.route("/", methods=["GET"])
def get_post_analytics():
    return jsonify({"status": "api endpoint incomplete"}), 501

@post_analytics.route("/<int:post_id>", methods=["GET"])
def get_post_analytics_by_id(post_id):
    return jsonify({"status": "api endpoint incomplete"}), 501