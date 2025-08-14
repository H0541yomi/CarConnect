from flask import Blueprint, jsonify, request
from mysql.connector import Error
from backend.db_connection import db

events = Blueprint("events", __name__)

@events.route("/", methods=["GET"])
def get_events():
    return jsonify({"status": "api endpoint incomplete"}), 501

@events.route("/", methods=["POST"])
def create_event():
    return jsonify({"status": "api endpoint incomplete"}), 501

@events.route("/<int:event_id>", methods=["GET"])
def get_event(event_id):
    return jsonify({"status": "api endpoint incomplete"}), 501

@events.route("/<int:event_id>", methods=["PUT"])
def update_event(event_id):
    return jsonify({"status": "api endpoint incomplete"}), 501

@events.route("/<int:event_id>", methods=["DELETE"])
def delete_event(event_id):
    return jsonify({"status": "api endpoint incomplete"}), 501