from models import customer


def register_customer(
        db,
        data
):
    db_conn = db.mysqlconnect()
    new_customer = customer.register_customer(db,data)
    db.disconnect()

    return new_customer
