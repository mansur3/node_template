const express = require("express");
const app = express();


app.use("/", (req, res) => {
    res.status(200).send({
        message : "Power is always dangerous, it's attract the worst and corrupt the best."
    })
})


app.listen(5000, () => {
    console.log("Listening on port 5000")
})