from flask import Blueprint, jsonify
from backend.db_connection import db

users = Blueprint("users", __name__)

@users.route("/", methods=["GET"])
def get_users():
    return jsonify({"status": "api endpoint incomplete"}), 501

@users.route("/", methods=["POST"])
def create_user():
    return jsonify({"status": "api endpoint incomplete"}), 501

@users.route("/<int:user_id>", methods=["GET"])
def get_user(user_id):
    return jsonify({"status": "api endpoint incomplete"}), 501

@users.route("/<int:user_id>", methods=["PUT"])
def update_user(user_id):
    return jsonify({"status": "api endpoint incomplete"}), 501

@users.route("/<int:user_id>", methods=["DELETE"])
def delete_user(user_id):
    return jsonify({"status": "api endpoint incomplete"}), 501