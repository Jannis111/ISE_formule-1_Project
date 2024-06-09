from pymongo.mongo_client import MongoClient
from pymongo.server_api import ServerApi

uri = "mongodb+srv://ddhartgers:1UC5lBTOywcfTEJK@f1jsondb.cyfdpwg.mongodb.net/?retryWrites=true&w=majority&appName=F1JSONDB&tlsAllowInvalidCertificates=true"
# Create a new client and connect to the server
client = MongoClient(uri, server_api=ServerApi('1'))

# Send a ping to confirm a successful connection
try:
    client.admin.command('ping')
    print("Pinged your deployment. You successfully connected to MongoDB!")
except Exception as e:
    print(e)

# Select the database
db = client['F1JSONDATABASE']

# Select the collection
collection = db['F1']

# Use the find() method to get a cursor
cursor = collection.find()

# Iterate over the cursor to access the documents
for document in cursor:
    print(document)

# create new data
document = {
    "name": "John Doe",
    "email": "john.doe@example.com",
    "age": 30
}

# Insert the document into the collection
collection.insert_one(document)



#