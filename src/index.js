// index.js

const express = require("express");
const axios = require("axios");

const app = express();
const port = 3000;

app.get("/", async (req, res) => {
  try {
    // Make a request using Axios to an example API (replace with your actual API endpoint)
    const response = await axios.get(
      "https://jsonplaceholder.typicode.com/todos/1"
    );
    const data = response.data;

    res.json(data);
  } catch (error) {
    console.error("Error fetching data:", error);
    res.status(500).send("Internal Server Error");
  }
});

app.listen(port, () => {
  console.log(`Server is listening on port ${port}`);
});
