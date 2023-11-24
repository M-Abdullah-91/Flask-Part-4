from flask import Blueprint, request

from controller.customer import register_customer
import db
from models import customer


def _is_valid_employee_data(data):
    error_msg = None

    if data.get("name") is None or len(data.get("name").strip()) == 0:
        error_msg = "name field is required"

    if data.get("email") is None or len(data.get("email").strip()) == 0:
        error_msg = "email field is required"

    if data.get("password") is None or len(data.get("password").strip()) == 0:
        error_msg = "password field is required"

    return error_msg


def register_new_customer():
    data = request.get_json()
    if (error := _is_valid_employee_data(data)) is not None:
        return {
            "message": "error"
        }, 400

    new_customer = customer.register_customer(db, data)

    return new_customer
