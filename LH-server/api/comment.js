const comment = require('../mongodb/schema')

app.post("/AddComment", (req, res) => {
    
    comment.insertOne(
        {
            author: req.body.name,
            avatar: 'https://joeschmoe.io/api/v1/random',
            content: req.body.value,
            datetime: req.body.now
        },
        (err, result) => {
            if (err) {
                console.error("err: "+err)
                res.status(500).json({ err: err })
                return
            }
            res.status(200).json({ status:'ok' })
        }
    )
})

app.get("/GetComment", (req, res) => {
    comment.find().toArray((err, items) => {
      if (err) {
        console.error(err)
        res.status(500).json({ err: err })
        return
      }
      res.status(200).json({ comment: items })
    })
  })