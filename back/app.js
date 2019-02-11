const express = require("express");
const path = require("path");
const logger = require("morgan");

const app = express();

app.use(express.json());
app.use(logger("dev"));

app.use(express.static(path.join(__dirname, "public")));

const port = process.env.PORT || 3000;
app.listen(port, () => console.log("Working"));