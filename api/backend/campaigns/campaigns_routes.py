from random import random
from flask import Blueprint, jsonify, request
from mysql.connector import Error
from backend.db_connection import db

campaigns = Blueprint("campaigns", __name__)

# Check to see how a campaign is doing (Advertiser story 3)
@campaigns.route("/<int:advertiser_id>", methods=["GET"])
def get_campaigns(advertiser_id):
    try:
        cursor = db.get_db().cursor()
        cursor.execute("SELECT * FROM Campaign_Analytics WHERE AnalystId = %s", (advertiser_id,))
        campaigns = cursor.fetchall()
        cursor.close()
        return jsonify({"campaigns": campaigns}), 200
    except Error as e:
        return jsonify({"error": str(e)}), 500

# Create a new campaign
# Required param: Name
@campaigns.route("/<int:advertiser_id>", methods=["POST"])
def create_campaign(advertiser_id):
    try:
        cursor = db.get_db().cursor()
        
        name = request.json.get("Name")
        if not name:
            return jsonify({"error": "Name is required"}), 400

        new_id = None
        unique_id = False
        while not unique_id:
            new_id = random.randint(1, 99999999999)
            cursor.execute("SELECT COUNT(*) FROM Campaign_Analytics WHERE CampaignID = %s", (new_id,))
            unique_id = cursor.fetchone()[0] == 0

        cursor.execute("INSERT INTO Campaign_Analytics (CampaignID, AnalystID, Name) VALUES (%s, %s, %s)", 
                       (new_id, advertiser_id, name))
        db.get_db().commit()
        cursor.close()
        
        return jsonify({"status": "success", "campaign_id": new_id}), 201
    except Error as e:
        return jsonify({"error": str(e)}), 500

# Get information on a specific campaign
@campaigns.route("/<int:campaign_id>", methods=["GET"])
def get_campaign_analytics(campaign_id):
    try:
        cursor = db.get_db().cursor()

        cursor.execute("SELECT * FROM Campaign_Analytics WHERE CampaignID = %s", (campaign_id,))
        campaign = cursor.fetchone()
        cursor.close()

        if campaign:
            return jsonify({"campaign": campaign}), 200
        else:
            return jsonify({"error": "Campaign not found"}), 404
    except Error as e:
        return jsonify({"error": str(e)}), 500