from flask import Blueprint, jsonify
from mysql.connector import Error
from backend.db_connection import db

car_trends = Blueprint("car_trends", __name__)

@car_trends.route("/", methods=["GET"])
def get_car_trends():
    return jsonify({"status": "api endpoint incomplete"}), 501