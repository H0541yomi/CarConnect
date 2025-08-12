from flask import Blueprint, jsonify

cars = Blueprint("cars", __name__)

@cars.route("/", methods=["GET"])
def get_cars():
    return jsonify({"status": "api endpoint incomplete"}), 501

@cars.route("/", methods=["POST"])
def create_car():
    return jsonify({"status": "api endpoint incomplete"}), 501

@cars.route("/<int:car_id>", methods=["GET"])
def get_car(car_id):
    return jsonify({"status": "api endpoint incomplete"}), 501

@cars.route("/<int:car_id>", methods=["PUT"])
def update_car(car_id):
    return jsonify({"status": "api endpoint incomplete"}), 501

@cars.route("/<int:car_id>", methods=["DELETE"])
def delete_car(car_id):
    return jsonify({"status": "api endpoint incomplete"}), 501