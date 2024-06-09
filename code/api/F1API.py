## Dit bestand bevat het api die verzoeken van de relationele database naar de MongoDB database stuurt.

from flask import Flask, request
from pymongo.mongo_client import MongoClient
from pymongo.server_api import ServerApi

app = Flask(__name__)

@app.route('/', methods=['POST'])
def receive_json():
    json_data = request.get_json()
    print("Received JSON data:", json_data)

    if checkJSONExists(json_data) == 0:
        sendDataToMongoDB(json_data)
        print("Request was send to MongoDB")
    else:
        print("Request already exists in MongoDB")
        deleteJSONInMongoDB(json_data)
        print("Delete JSON: " + json_data["name"] + " in MongoDB")
        sendDataToMongoDB(json_data)
        print("Request was send to MongoDB")
    return 'Received JSON data'

def deleteJSONInMongoDB(data):
    uri = "mongodb+srv://ddhartgers:1UC5lBTOywcfTEJK@f1jsondb.cyfdpwg.mongodb.net/?retryWrites=true&w=majority&appName=F1JSONDB&tlsAllowInvalidCertificates=true"
    client = MongoClient(uri, server_api=ServerApi('1'))
    db = client['F1JSONDATABASE']
    collection = db['F1']
    collection.delete_many({"name": data["name"]})

def sendDataToMongoDB(data):
    uri = "mongodb+srv://ddhartgers:1UC5lBTOywcfTEJK@f1jsondb.cyfdpwg.mongodb.net/?retryWrites=true&w=majority&appName=F1JSONDB&tlsAllowInvalidCertificates=true"
    client = MongoClient(uri, server_api=ServerApi('1'))
    db = client['F1JSONDATABASE']
    collection = db['F1']
    collection.insert_one(data)

def checkJSONExists(data):
    uri = "mongodb+srv://ddhartgers:1UC5lBTOywcfTEJK@f1jsondb.cyfdpwg.mongodb.net/?retryWrites=true&w=majority&appName=F1JSONDB&tlsAllowInvalidCertificates=true"
    client = MongoClient(uri, server_api=ServerApi('1'))
    db = client['F1JSONDATABASE']
    collection = db['F1']
    result = collection.find({"name": data["name"]})
    if len(list(result)) == 0:
        return 0
    else:
        return 1

if __name__ == '__main__':
    app.run(host='localhost', port=4444)

