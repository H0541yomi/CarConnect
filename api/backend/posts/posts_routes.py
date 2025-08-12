from flask import Blueprint, jsonify

posts = Blueprint("posts", __name__)

@posts.route("/", methods=["GET"])
def get_posts():
    return jsonify({"status": "api endpoint incomplete"}), 501

@posts.route("/", methods=["POST"])
def create_post():
    return jsonify({"status": "api endpoint incomplete"}), 501

@posts.route("/<int:post_id>", methods=["GET"])
def get_post(post_id):
    return jsonify({"status": "api endpoint incomplete"}), 501

@posts.route("/<int:post_id>", methods=["PUT"])
def update_post(post_id):
    return jsonify({"status": "api endpoint incomplete"}), 501

@posts.route("/<int:post_id>", methods=["DELETE"])
def delete_post(post_id):
    return jsonify({"status": "api endpoint incomplete"}), 501