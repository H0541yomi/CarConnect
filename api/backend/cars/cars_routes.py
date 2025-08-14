from mysql.connector import Error
from flask import Blueprint, jsonify, request
from backend.db_connection import db

cars = Blueprint("cars", __name__)

# Get a list of cars (Advertiser story 4/6, User story 2/4)
# Optional params for filtering: Make, Model, PurchaseDate, Exhaust, Turbo, Engine, Wheels, Downpipes
# MinWeight, MaxWeight, MinLength, MaxLength, MinHeight, MaxHeight, MinTopSpeed, FuelType
@cars.route("/", methods=["GET"])
def get_cars():
    try:
        cursor = db.get_db().cursor()
        
        query = """
        SELECT *
        FROM Cars AS c JOIN Car_Meta ON c.CarId = Car_Meta.CarId
        JOIN Car_Build ON Car_Build.CarId = c.CarId
        WHERE 1=1
        """

        filters = []
        string_params = ["Make", "Model", "Exhaust", "Turbo", "Engine", "Wheels", "Downpipes", "FuelType"]
        min_params = ["MinWeight", "MinLength", "MinHeight", "MinTopSpeed"]
        max_params = ["MaxWeight", "MaxLength", "MaxHeight"]

        for param in string_params:
            if param in request.args:
                query += f" AND {param} = %s"
                filters.append(param)
        for param in min_params:
            if param in request.args:
                query += f" AND {param} >= %s"
                filters.append(param)
        for param in max_params:
            if param in request.args:
                query += f" AND {param} <= %s"
                filters.append(param)

        cursor.execute(query, filters)
        cars = cursor.fetchall()
        cursor.close()

        return jsonify(cars), 200
    except Error as e:
        return jsonify({"error": str(e)}), 500

# Give a user a new car (User story 6)
# PASSED
@cars.route("/<int:user_id>/cars", methods=["POST"])
def add_user_car(user_id):
    try:
        data = request.get_json()
        cursor = db.get_db().cursor()

        # Insert new car
        car_insert_query = """
        INSERT INTO Cars (OwnerId, Make, Model, ModelYear, ExteriorColor, InteriorColor, PurchaseDate)
        VALUES (%s, %s, %s, %s, %s, %s, %s)
        """
        
        cursor.execute(
            car_insert_query,
            (user_id, data["Make"], data["Model"], data["ModelYear"],
             data["ExteriorColor"], data["InteriorColor"], data["PurchaseDate"])
        )
        db.get_db().commit()
        
        new_car_id = cursor.lastrowid
        cursor.close()

        return jsonify({"message": "Car added successfully", "CarId": new_car_id}), 201

    except Error as e:
        return jsonify({"error": str(e)}), 500


# Update user car (User story 6)
# A lot of optional params, refer to relational database diagram or SQL DDL to see all options
# (or just look at the UPDATE statements)
# PASSED
@cars.route("/<int:car_id>", methods=["PUT"])
def update_user_car(car_id):
    try:
        data = request.get_json()
        cursor = db.get_db().cursor()

        cars_query = """
        UPDATE Cars
        SET Make = %s, Model = %s, ModelYear = %s, ExteriorColor = %s,
        InteriorColor = %s, PurchaseDate = %s
        WHERE carid = %s
        """
        cursor.execute(cars_query, (
            data.get("Make"),
            data.get("Model"),
            data.get("ModelYear"),
            data.get("ExteriorColor"),
            data.get("InteriorColor"),
            data.get("PurchaseDate"),
            car_id
        ))
        db.get_db().commit()
        
        if cursor.rowcount == 0:
            return jsonify({"error": "CarId not found"}), 404
        
        build_query = """
        UPDATE Car_Build
        SET Exhaust = %s, Turbo = %s, Engine = %s, Wheels = %s, Downpipes = %s
        WHERE carid = %s
        """
        cursor.execute(build_query, (
            data.get("Exhaust"),
            data.get("Turbo"),
            data.get("Engine"),
            data.get("Wheels"),
            data.get("Downpipes"),
            car_id
        ))
        db.get_db().commit()
        
        meta_query = """
        UPDATE Car_Meta
        SET Weight = %s, Length = %s, Width = %s, Height = %s,
        TopSpeed = %s, FuelType = %s
        WHERE carid = %s
        """
        cursor.execute(meta_query, (
            data.get("Weight"),
            data.get("Length"),
            data.get("Width"),
            data.get("Height"),
            data.get("TopSpeed"),
            data.get("FuelType"),
            car_id
        ))
        db.get_db().commit()
        cursor.close()

        return jsonify({"message": "User cars updated successfully"}), 200

    except Error as e:
        return jsonify({"error": str(e)}), 500

# Delete a car from the database (User story 6)
# PASSED
@cars.route("/<int:car_id>", methods=["DELETE"])
def delete_car(car_id):
    try:
        cursor = db.get_db().cursor()

        # Delete from Cars, Car_Meta and Car_Build will cascade the delete
        cars_query = """
        DELETE FROM Cars
        WHERE CarId = %s
        """
        cursor.execute(cars_query, (car_id,))
        db.get_db().commit()

        cursor.close()

        return jsonify({"message": "Car deleted successfully"}), 200

    except Error as e:
        return jsonify({"error": str(e)}), 500