from sqlalchemy import create_engine
import falcon
from falcon_autocrud.middleware import Middleware
import psycopg2
from resources import *


db_engine = create_engine('postgresql+psycopg2://retailer:retailer@localhost/retailer_api')
# db_inodis = create_engine('postgresql+psycopg2://postgres:Ortica7@localhost/inodis_testshops')
db_inodis = create_engine('postgresql+psycopg2://inodis:patatim@localhost/inodis_testshops')

app = application = falcon.API(middleware=[Middleware()])

app.add_route('/retailers', RetailerCollectionResource(db_engine))
app.add_route('/retailer/{id}', RetailerResource(db_engine))

app.add_route('/stores', InodisStores(db_inodis))
app.add_route('/products', InodisProducts(db_inodis))

