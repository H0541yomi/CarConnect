from flask import Blueprint, jsonify

car_trends = Blueprint("car_trends", __name__)

@car_trends.route("/", methods=["GET"])
def get_car_trends():
    return jsonify({"status": "api endpoint incomplete"}), 501