import random
import string
import json

# from pathlib import Path
from faker import Faker

outfile = "retailer_api.json"
retailers = []

fake = Faker()

for i in range(1, 101):
    retailer = {}
    retailer["id"] = i
    retailer["GSTIN"] = ''.join(random.choice(
        string.ascii_uppercase + string.ascii_lowercase + string.digits) for _ in range(15))
    retailer["Business_name"] = fake.name()
    retailer["Contact_person"] = fake.name()
    retailer["Contact_number"] = int(
        ''.join(random.choice(string.digits) for _ in range(5)))
    retailer["Contact_address"] = fake.address()
    retailer["Contact_emailId"] = fake.email()
    retailer["Status"] = random.choice(["active", "inactive", "active"])
    retailer["Outlet_limit"] = random.choice(range(1, 11))
    retailers.append(retailer)

with open(outfile, "w") as f:
    json.dump(retailers, f, indent=2)
