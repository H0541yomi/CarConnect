from flask import Blueprint, jsonify
from mysql.connector import Error
from backend.db_connection import db

communities = Blueprint("communities", __name__)

@communities.route("/", methods=["GET"])
def get_communities():
    return jsonify({"status": "api endpoint incomplete"}), 501

@communities.route("/", methods=["POST"])
def create_community():
    return jsonify({"status": "api endpoint incomplete"}), 501

@communities.route("/<int:community_id>", methods=["GET"])
def get_community(community_id):
    return jsonify({"status": "api endpoint incomplete"}), 501

@communities.route("/<int:community_id>", methods=["PUT"])
def update_community(community_id):
    return jsonify({"status": "api endpoint incomplete"}), 501

@communities.route("/<int:community_id>", methods=["DELETE"])
def delete_community(community_id):
    return jsonify({"status": "api endpoint incomplete"}), 501