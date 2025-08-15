from flask import Blueprint, jsonify, request
from mysql.connector import Error
from backend.db_connection import db

car_trends = Blueprint("car_trends", __name__)

@car_trends.route("/", methods=["GET"])
def get_car_trends():
    try:
        cursor = db.get_db().cursor()
        
        queries = {
            "make_model": """
                SELECT COUNT(Cars.CarId) AS NumCars, Make, Model
                FROM Cars JOIN Car_Build ON Cars.CarId = Car_Build.CarId
                JOIN Car_Meta ON Cars.CarId = Car_Meta.CarId
                GROUP BY Make, Model
                ORDER BY NumCars DESC
            """,
            "exhaust": """
                SELECT COUNT(Cars.CarId) AS NumCars, Exhaust
                FROM Cars JOIN Car_Build ON Cars.CarId = Car_Build.CarId
                JOIN Car_Meta ON Cars.CarId = Car_Meta.CarId
                GROUP BY Exhaust
                ORDER BY NumCars DESC
            """,
            "turbo": """
                SELECT COUNT(Cars.CarId) AS NumCars, Turbo
                FROM Cars JOIN Car_Build ON Cars.CarId = Car_Build.CarId
                JOIN Car_Meta ON Cars.CarId = Car_Meta.CarId
                GROUP BY Turbo
                ORDER BY NumCars DESC
            """,
            "engine": """
                SELECT COUNT(Cars.CarId) AS NumCars, Engine
                FROM Cars JOIN Car_Build ON Cars.CarId = Car_Build.CarId
                JOIN Car_Meta ON Cars.CarId = Car_Meta.CarId
                GROUP BY Engine
                ORDER BY NumCars DESC
            """,
            "wheels": """
                SELECT COUNT(Cars.CarId) AS NumCars, Wheels
                FROM Cars JOIN Car_Build ON Cars.CarId = Car_Build.CarId
                JOIN Car_Meta ON Cars.CarId = Car_Meta.CarId
                GROUP BY Wheels
                ORDER BY NumCars DESC
            """,
            "downpipes": """
                SELECT COUNT(Cars.CarId) AS NumCars, Downpipes
                FROM Cars JOIN Car_Build ON Cars.CarId = Car_Build.CarId
                JOIN Car_Meta ON Cars.CarId = Car_Meta.CarId
                GROUP BY Downpipes
                ORDER BY NumCars DESC
            """,
            "fuel_type": """
                SELECT COUNT(Cars.CarId) AS NumCars, FuelType
                FROM Cars JOIN Car_Build ON Cars.CarId = Car_Build.CarId
                JOIN Car_Meta ON Cars.CarId = Car_Meta.CarId
                GROUP BY FuelType
                ORDER BY NumCars DESC
            """
        }
        
        trends = {}
        for trend_name, query in queries.items():
            cursor.execute(query)
            trends[trend_name] = cursor.fetchall()
        
        cursor.close()
        
        return jsonify({"car_trends": trends}), 200
        
    except Error as e:
        return jsonify({"error": str(e)}), 500