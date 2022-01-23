const db = require("../db/models");
const book = db.book;

exports.findAll = (req, res) => {
  book.findAll()
    .then((data) => {
      res.json(data);
    })
    .catch((err) => {
      res
        .status(500)
        .send({ message: err.message || " Some Error retriving Books Data" });
    });
   
};
exports.findOne = (req, res) => {
  const id = parseInt(req.params.id);
  book
    .findByPk(id)
    .then((data) => {
      res.json(data);
    })
    .catch((err) => {
      res
        .status(500)
        .send({ message: err.message || "Some Error retriving Book Data" });
    });
};
exports.create = (req, res) => {
  book
    .create({
      bookName: req.body.bookName,
      authorName: req.body.authorName,
      publishdate: req.body.publishdate,
    })
    .then((data) => {
      res.json(data);
    })
    .catch((err) => {
      res
        .status(500)
        .send({ message: err.message || "Some Error creating Book" });
    });
};
exports.update = (req, res) => {
  const id = parseInt(req.params.id);
  book
    .update(
      {
        bookName: req.body.bookName,
        authorName: req.body.authorName,
        publishdate: req.body.publishdate,
      },
      {
        where: { id: id },
      }
    )
    .then((data) => {
      res.json(data);
    })
    .catch((err) => {
      res
        .status(500)
        .send({ message: err.message || "Some Error updating Book" });
    });
};

exports.delete = (req, res) => {
  const id = parseInt(req.params.id);
  book
    .destroy({
      where: { id: id },
    })
    .then((data) => {
      res.json(data);
    })
    .catch((err) => {
      res
        .status(500)
        .send({ message: err.message || "Some Error deleting Book" });
    });
};

