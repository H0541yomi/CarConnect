from flask import Blueprint, jsonify
from backend.db_connection import db

campaigns = Blueprint("campaigns", __name__)

@campaigns.route("/<int:advertiser_id>", methods=["GET"])
def get_campaigns_by_advertiser(advertiser_id):

    # cursor = db.get_db().cursor()
    
    # cursor.execute('''SELECT * FROM Campaign_Analytics WHERE CampaignID = 7 GROUP BY AnalystID
    #     ''')

    return jsonify({"status": "api endpoint incomplete"}), 501

@campaigns.route("/<int:advertiser_id>", methods=["POST"])
def create_campaign(advertiser_id):
    return jsonify({"status": "api endpoint incomplete"}), 501

@campaigns.route("/<int:campaign_id>", methods=["GET"])
def get_campaign_analytics(campaign_id):
    return jsonify({"status": "api endpoint incomplete"}), 501