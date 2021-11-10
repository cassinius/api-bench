import psycopg2
from faker import Faker
import random,string

connection = psycopg2.connect(host='localhost', database='retailer_api', user='retailer', password='retailer')
cursor = connection.cursor()
fake=Faker()

for i in range(1,101):
  id = i
  GSTIN = ''.join(random.choice(string.ascii_uppercase + string.ascii_lowercase + string.digits) for _ in range(15))
  Business_name=fake.name()
  Contact_person=fake.name()
  Contact_number=int(''.join(random.choice(string.digits) for _ in range(5)))
  Contact_address=fake.address()
  Contact_emailId=fake.email()
  Status=random.choice(["active", "inactive","active"])
  Outlet_limit=random.choice(range(1,11))
  cursor.execute('Insert into "retailer" (id,"GSTIN","Business_name","Contact_person","Contact_number","Contact_address","Contact_emailId","Status","Outlet_limit") VALUES (%s,%s,%s,%s,%s,%s,%s,%s,%s)',(id,GSTIN,Business_name,Contact_person,Contact_number,Contact_address,Contact_emailId,Status,Outlet_limit))
  #data=(id,GSTIN,Business_name,Contact_person,Contact_number,Contact_address,Contact_emailId,Status,Outlet_limit)
  #print(data)
  connection.commit()

cursor.execute('SELECT * FROM "retailer" WHERE id = 42')
retailer = cursor.fetchone()
print(retailer)
