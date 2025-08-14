from api.backend.Utils.ISOToSQL import date_to_formatted_datetime
from api.backend.Utils.UserStatus import is_event_host, is_moderator
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
        FROM Event
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

# Create an event (Event organizer story 1/6)
# Required params: UserId, Name
# Optional params (recommended): CommunityId, Description, Type, StartTime, EndTime, Region, Country
@events.route("/", methods=["POST"])
def create_event():
    try:
        cursor = db.get_db().cursor()
        data = request.get_json()
        
        host_id = data.get("UserId")
        event_name = data.get("Name")
        
        if not host_id or not event_name:
            return jsonify({"error": "Missing required fields: UserId and Name"}), 400

        community_id = data.get("CommunityId")
        description = data.get("Description")
        event_type = data.get("Type")
        start_time = date_to_formatted_datetime(data.get("StartTime"))
        end_time = date_to_formatted_datetime(data.get("EndTime"))
        region = data.get("Region")
        country = data.get("Country")

        query = """
        INSERT INTO Event (HostId, Name, CommunityId, Description, Type, StartTime, EndTime, Region, Country)
        VALUES (%s, %s, %s, %s, %s, %s, %s, %s, %s)
        """
        cursor.execute(query, (host_id, event_name, community_id, description, event_type, start_time, end_time, region, country))
        db.get_db().commit()
        event_id = cursor.lastrowid
        cursor.close()

        return jsonify({"message": "Event created successfully", "event_id": event_id}), 201

    except Error as e:
        return jsonify({"error": str(e)}), 500

# Get detailed information about an event
@events.route("/<int:event_id>", methods=["GET"])
def get_event(event_id):
    try:
        cursor = db.get_db().cursor()
        
        basic_info_query = "SELECT * FROM Event WHERE Event.EventId = %s"
        associated_communities_query = """
        SELECT *
        FROM Community
        WHERE CommunityId = (
            SELECT CommunityId
            FROM EventCommunity
            WHERE EventId = %s
        )
        """
        
        cursor.execute(basic_info_query, (event_id,))
        cursor.execute(associated_communities_query, (event_id,))
        basic_info = cursor.fetchone()
        associated_communities = cursor.fetchall()
        cursor.close()

        return jsonify({"event_info": basic_info, "community_hosts": associated_communities}), 200
    
    except Error as e:
        return jsonify({"error": str(e)}), 500

# Edit event details (Event organizer story 1)
# Optional params: Name, Description, Type, StartTime, EndTime, Region, Country
@events.route("/<int:event_id>", methods=["PUT"])
def update_event(event_id):
    try:
        cursor = db.get_db().cursor()
        data = request.get_json()

        query = """
        UPDATE Event
        SET 
        """

        params = []
        string_subs = []
        for param in ["Name", "Description", "Type", "StartTime", "EndTime", "Region", "Country"]:
            if param in data:
                params.append(param)
                string_subs.append(data[param])

        query += ", ".join([f"{param} = %s" for param in params])
        query += " WHERE EventId = %s"
        string_subs.append(event_id)

        cursor.execute(query, string_subs)
        db.get_db().commit()
        cursor.close()

        return jsonify({"message": "Event updated successfully"}), 200

    except Error as e:
        return jsonify({"error": str(e)}), 500

# Delete an event
# Required param: UserId
@events.route("/<int:event_id>", methods=["DELETE"])
def delete_event(event_id):
    try:
        cursor = db.get_db().cursor()
        data = request.get_json()

        can_delete = is_event_host(data.get("UserId"), event_id) or is_moderator(data.get("UserId"))

        if not can_delete:
            return jsonify({"error": "User is not authorized to delete this event"}), 403

        cursor.execute("DELETE FROM Event WHERE EventId = %s", (event_id,))
        db.get_db().commit()
        cursor.close()

        return jsonify({"message": "Event deleted successfully"}), 200

    except Error as e:
        return jsonify({"error": str(e)}), 500