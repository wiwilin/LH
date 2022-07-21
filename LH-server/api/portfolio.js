const {Mportfolio} = require('../mongodb/schema')

var dateTime = require('node-datetime');

app.post("/AddPortfolio", (req, res) => {

    Mportfolio.create(
        {
            _id: new (ObjectId),
            email: req.body.Email,
            portfolio: req.body.portfolioName,
            color: 'grey',
            img: 'https://jrlinkhub.s3.ap-southeast-2.amazonaws.com/1.png',
            lists: ["https://linktr.ee/"],
            datetime: dateTime.create().format('Y-m-d')
        },
        (err, result) => {
            if (err) {
                console.error("err: " + err)
                res.status(500).json({ err: err })
                return
            }
            res.status(200).json({ id: result._id })
        }
    )
})

app.post("/GetPortfolio", (req, res) => {

    Mportfolio.find(
        {
            email: req.body.Email
        }
        , (err, items) => {
            if (err) {
                console.error(err)
                res.status(500).json({ err: err })
                return
            }
            res.status(200).json({ portfolio: items })
        }
    )
})

app.post("/PublishPortfolio", (req, res) => {

    console.log("publish " + req.body.id + "name " + req.body.name);

    Mportfolio.findByIdAndUpdate
        (

            req.body.id,

            {
                $set: {
                    portfolio: req.body.name,
                    email: req.body.email,
                    color: req.body.color,
                    img: req.body.img,
                    lists: req.body.lists
                }
            }, { upsert: true },
            (err, result) => {
                if (err) {
                    console.error("err: " + err)
                    res.status(500).json({ err: err })
                    return
                }
                res.status(200).json({ id: req.body._id })

            }
        )
})

app.post('/GetShare', function (req, res) {

    Mportfolio.findById(
        {
            _id: req.body.id,
        },
        (err, result) => {
            if (err) {
                console.error("err: " + err)
                res.status(500).json({ err: err })
                return
            }

            // res.status(200).json({ color: result.color, img:result.img,lists:result.lists })

            res.status(200).json(result);
        }
    )
})