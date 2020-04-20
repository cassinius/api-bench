from app import app
import psycopg2
from flask import jsonify
connection = psycopg2.connect(host='localhost', database='retailer_api', user='retailer', password='retailer')
cursor = connection.cursor()


@app.route('/')
@app.route('/index')
def index():
    return "Hello, World!"


@app.route('/retailers')
def retailers():
  cursor.execute('SELECT * FROM retailer')
  retailer = cursor.fetchall()
  # print(retailer)
  return jsonify(retailer)


@app.route('/retailer/<user_id>')
def retailer(user_id):
  cursor.execute("""SELECT * FROM retailer WHERE id = %s""" % user_id)
  retailer = cursor.fetchone()
  # print(retailer)
  return jsonify(retailer)
