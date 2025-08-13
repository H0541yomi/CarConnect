from flask import Blueprint, jsonify
from backend.db_connection import db

event_resources = Blueprint("event_resources", __name__)

@event_resources.route("/", methods=["GET"])
def get_event_resources():
    return jsonify({"status": "api endpoint incomplete"}), 501