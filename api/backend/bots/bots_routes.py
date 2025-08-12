from flask import Blueprint, jsonify

bots = Blueprint("bots", __name__)

@bots.route("/", methods=["GET"])
def get_bots():
    return jsonify({"status": "api endpoint incomplete"}), 501

@bots.route("/", methods=["POST"])
def create_bot():
    return jsonify({"status": "api endpoint incomplete"}), 501

@bots.route("/<int:bot_id>", methods=["GET"])
def get_bot(bot_id):
    return jsonify({"status": "api endpoint incomplete"}), 501

@bots.route("/<int:bot_id>", methods=["POST"])
def create_bot_script(bot_id):
    return jsonify({"status": "api endpoint incomplete"}), 501

@bots.route("/<int:bot_id>", methods=["PUT"])
def update_bot(bot_id):
    return jsonify({"status": "api endpoint incomplete"}), 501

@bots.route("/<int:bot_id>", methods=["DELETE"])
def delete_bot(bot_id):
    return jsonify({"status": "api endpoint incomplete"}), 501

@bots.route("/<int:bot_id>/<int:script_id>", methods=["GET"])
def get_bot_script(bot_id, script_id):
    return jsonify({"status": "api endpoint incomplete"}), 501

@bots.route("/<int:bot_id>/<int:script_id>", methods=["PUT"])
def edit_bot_script(bot_id, script_id):
    return jsonify({"status": "api endpoint incomplete"}), 501

@bots.route("/<int:bot_id>/<int:script_id>", methods=["DELETE"])
def delete_bot_script(bot_id, script_id):
    return jsonify({"status": "api endpoint incomplete"}), 501   