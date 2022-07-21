const user = require('../mongodb/schema')
const nodemailer = require("nodemailer");


app.post("/SignUp", (req, res) => {

    users.insertOne(
        {
            email: req.body.email,
            password: req.body.password
        },
        (err, result) => {
            if (err) {
                console.error("err: "+err)
                res.status(500).json({ err: err })
                return
            }
            res.status(200).json({ email: req.body.email })
        }
    )
})

app.post('/login', function (req, res) {
    users.findOne(
        {
            email: req.body.email,
        },
        (err, result) => {
            if (err) {
                console.error("err: "+err)
                res.status(500).json({ err: err })
                return
            }
            else if (req.body != null && result && req.body.password == result.password) {
                res.status(200).json({ token: req.body.email })
                console.log("verified " + req.body.email + "password "+ JSON.stringify(result).password)
            }
            else if (!result) {
                res.status(200).json({ token: "not found" })
                console.log("not found")
            }
            else {
                res.status(200).json({ token: "incorrect" })            //Can this realy happen?
                console.log("failed")   
            }

        }
    )
})


