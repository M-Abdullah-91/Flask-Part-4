from flask import Flask
from routes.customer import register_customer

app = Flask(__name__)


# Register the customer
app.add_url_rule('/register/customer', view_func=register_customer.register_customer, methods=['POST'])

if __name__ == "__main__":
    app.run(
        debug=True
    )
