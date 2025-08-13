from flask import Blueprint, jsonify
from backend.db_connection import db

follows = Blueprint("follows", __name__)

@follows.route("/<int:user_id>", methods=["GET"])
def get_follows(user_id):
    return jsonify({"status": "api endpoint incomplete"}), 501

@follows.route("/<int:user_id>", methods=["POST"])
def follow_user(user_id):
    return jsonify({"status": "api endpoint incomplete"}), 501

@follows.route("/<int:user_id>/<int:followed_user_id>", methods=["DELETE"])
def unfollow_user(user_id, followed_user_id):
    return jsonify({"status": "api endpoint incomplete"}), 501