const express = require("express");
const path = require("path");
const logger = require("morgan");

const app = express();

app.use(express.json());
app.use(logger("dev"));

// Add routes to stuff in public folder
app.use(express.static(path.join(__dirname, "public")));

app.get("/", (req, res) => {
  res.sendFile(path.join(__dirname, "public", "index.html"), err => console.log(err));
});

// Catch-all request (if user goes to a URL that only the client can resolve (AKA vue-router),
// Send the user the .html file, rather than trying to resolve the URL server-side
// If this is disabled, would get something like 'Cannot GET /orbitals, if client navigates to /orbitals tab'
app.get('/*', (req, res) => {
  res.sendFile(path.join(__dirname, "public", "index.html"), err => console.log(err));
});

// app.get('/*', (req, res) => {
//   res.send("<p>Test</p>"), err => console.log(err);
// });

const port = process.env.PORT || 3005;
app.listen(port, () => console.log("Working"));