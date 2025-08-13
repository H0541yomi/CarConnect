from flask import Blueprint, jsonify
from backend.db_connection import db

messages = Blueprint("messages", __name__)

@messages.route("/<int:group_id>", methods=["GET"])
def get_messages(group_id):
    return jsonify({"status": "api endpoint incomplete"}), 501

@messages.route("/<int:group_id>", methods=["POST"])
def create_message(group_id):
    return jsonify({"status": "api endpoint incomplete"}), 501

@messages.route("/<int:group_id>/<int:message_id>", methods=["PUT"])
def update_message(group_id, message_id):
    return jsonify({"status": "api endpoint incomplete"}), 501

@messages.route("/<int:group_id>/<int:message_id>", methods=["DELETE"])
def delete_message(group_id, message_id):
    return jsonify({"status": "api endpoint incomplete"}), 501