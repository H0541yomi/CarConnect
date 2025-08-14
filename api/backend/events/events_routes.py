from api.backend.Utils.ISOToSQL import date_to_formatted_datetime
from flask import Blueprint, jsonify, request
from mysql.connector import Error
from backend.db_connection import db

events = Blueprint("events", __name__)

# Get a list of events (Helps with event organizer story 6 if they want to search for events to duplicate)
# Optional params for filtering: Name, Type, StartDate, EndDate, Region, Country
@events.route("/", methods=["GET"])
def get_events():
    try:
        cursor = db.get_db().cursor()
        
        query = """
        SELECT *
        FROM Events
        WHERE 1=1
        """
        filters = []
        
        start_date = date_to_formatted_datetime(request.args.get("StartDate"))
        end_date = date_to_formatted_datetime(request.args.get("EndDate"))

        if start_date:
            query += " AND StartDate >= %s"
            filters.append(start_date)
        if end_date:
            query += " AND EndDate <= %s"
            filters.append(end_date)
        for param in ["Name", "Type", "Region", "Country"]:
            if param in request.args:
                query += f" AND {param} = %s"
                filters.append(request.args.get(param))
                
        cursor.execute(query, filters)
        events = cursor.fetchall()
        cursor.close()
        
        return jsonify(events), 200
    except Error as e:
        return jsonify({"error": str(e)}), 500

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