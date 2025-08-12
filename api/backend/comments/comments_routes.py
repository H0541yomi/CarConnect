from flask import Blueprint, jsonify

comments = Blueprint("comments", __name__)

@comments.route("/", methods=["GET"])
def get_comments():
    return jsonify({"status": "api endpoint incomplete"}), 501

@comments.route("/", methods=["POST"])
def create_comment():
    return jsonify({"status": "api endpoint incomplete"}), 501

@comments.route("/<int:comment_id>", methods=["GET"])
def get_comment(comment_id):
    return jsonify({"status": "api endpoint incomplete"}), 501

@comments.route("/<int:comment_id>", methods=["PUT"])
def update_comment(comment_id):
    return jsonify({"status": "api endpoint incomplete"}), 501

@comments.route("/<int:comment_id>", methods=["DELETE"])
def delete_comment(comment_id):
    return jsonify({"status": "api endpoint incomplete"}), 501