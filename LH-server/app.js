const express = require("express")
const cors = require('cors');

const app = express()
app.use(cors());
app.use(express.json())

const PORT = process.env.PORT || 5000;

app.listen(PORT, 5000, () => console.log(`LH Server ready on port ${PORT}`))

