# All queries related to customer
from datetime import date


def register_customer(db_conn, data):
    name = data.get['name']
    email = data.get['email']
    password = data.get['password']
    created_at = date.today()

    query = "INSERT INTO customer(name, email, password, created_at) VALUES (%s, %s, %s, %s)"
    values = name, email, password, created_at

    cur = db_conn.cursor()

    cur.execute(query, values)

    db_conn.commit()
    return cur.lastrowid
