from flask import Blueprint, jsonify

rsvps = Blueprint("rsvps", __name__)

@rsvps.route("/<int:event_id>", methods=["GET"])
def get_rsvps(event_id):
    return jsonify({"status": "api endpoint incomplete"}), 501

@rsvps.route("/<int:event_id>", methods=["POST"])
def create_rsvp(event_id):
    return jsonify({"status": "api endpoint incomplete"}), 501