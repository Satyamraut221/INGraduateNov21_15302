module.exports = (app) => {
  const express = require("express");

  const ROUTER = express.Router();

  const bookControler=require('./book-controler')
 
  ROUTER.get("/book",bookControler.findAll );

   ROUTER.get("/book/:id", bookControler.findOne);

   ROUTER.post("/book/add", bookControler.create);

  ROUTER.put("/book/update/:id",bookControler.update);

  ROUTER.delete("/book/delete/:id", bookControler.delete);

  app.use("/app", ROUTER);
};
