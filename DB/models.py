from sqlalchemy.ext.declarative import declarative_base
from sqlalchemy import create_engine, Column, Integer, String

Base=declarative_base()
# retailer is your username in postgres. retailer is the password.
DB_URI = 'postgresql+psycopg2://retailer:retailer@localhost/retailer_api'


class Retailer(Base):
  __tablename__ = 'retailer'
  id = Column(Integer,primary_key=True)
  GSTIN = Column(String(15))
  Business_name = Column(String(100))
  Contact_person = Column(String(50))
  Contact_number = Column(Integer)
  Contact_address = Column(String(100))
  Contact_emailId = Column(String(50))
  Status = Column(String(10))
  Outlet_limit=Column(Integer)


class InodisStore(Base):
  __tablename__ = 'store'
  id = Column(Integer,primary_key=True)
  name = Column(String(255))


class InodisProduct(Base):
  __tablename__ = 'product'
  id = Column(Integer,primary_key=True)
  title = Column(String(255))
  body_sanitized = Column(String(5000))


if __name__ == "__main__":
  from sqlalchemy import create_engine
  engine = create_engine(DB_URI)
  Base.metadata.drop_all(engine)
  Base.metadata.create_all(engine)

