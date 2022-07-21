const mongo = require("mongodb").MongoClient
const ObjectId = require('mongodb').ObjectId;

const url = "mongodb+srv://linkhub:linkhub@cluster0.gtura.mongodb.net/LinkHub?retryWrites=true&w=majority";

mongo.connect(
    url,
    {
        useNewUrlParser: true,
        useUnifiedTopology: true,
    },
    (err, client) => {
        if (err) {
            console.error(err)
            return
        }
        const db = client.db("LinkHub")
        const users = db.collection("users");
        const portfolio = db.collection("portfolio");
        const comment = db.collection("comment");
    }
)

module.exports = {db,users,portfolio,comment}