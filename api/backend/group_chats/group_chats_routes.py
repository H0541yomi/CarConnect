from flask import Blueprint, jsonify

group_chats = Blueprint("group_chats", __name__)

@group_chats.route("/<int:group_id>", methods=["GET"])
def get_group_chat(group_id):
    return jsonify({"status": "api endpoint incomplete"}), 501

@group_chats.route("/<int:group_id>", methods=["PUT"])
def update_group_chat(group_id):
    return jsonify({"status": "api endpoint incomplete"}), 501

@group_chats.route("/<int:group_id>", methods=["DELETE"])
def delete_group_chat(group_id):
    return jsonify({"status": "api endpoint incomplete"}), 501