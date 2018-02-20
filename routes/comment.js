var express = require('express');
var router = express.Router();
var db = require('../db');
var qrec = require('pg-promise').errors.queryResultErrorCode;

var Comment = require('../models/Comment');

/* POST comment */
router.post('/',  (req, res, next) => {
  const comment = Comment.Mapper.httpToModel(req.body);
  db.comment.insert(comment)
  .then(data => {
    res.status(201).json(data);
  })
  .catch(error => {
    res.status(500).json({error: error.message});
  });
});

/* GET comment */
router.get('/:id', (req, res, next) => {
  db.comment.get(req.params.id)
  .then(data => {
    res.json(Comment.Mapper.dbToModel(data));
  })
  .catch(error => {
    if (error.code === qrec.noData) {
      res.status(404);
    } else {
      res.status(500);
    }
    res.json({error: error.message});
  });
});

module.exports = router;
