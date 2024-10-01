const express = require("express");
const mongoose = require("mongoose");
const authRouter = require("./routes/auth");

//define the port number the server will listen on
const PORT = 3000;

//create an instant of an express application
//because it give us the starting point

const app = express();

//mongodb String
const DB =
  "mongodb+srv://samarasingheoshini2001:Osh200112@cluster0.jcpco.mongodb.net/";
app.use(express.json());
app.use(authRouter);
mongoose.connect(DB).then(() => {
  console.log("mongodb connected");
});

//start the server and listen on the specified port
app.listen(PORT, "0.0.0.0", function () {
  //LOG THE NUMBER
  console.log(`Server is running on port ${PORT}`);
});
