var express = require('express');
var router = express.Router();

// const objectmapper = require('../db/objectmapper');
var CommentModel = require('../models/CommentModel');

/* GET home page. */
router.post('/',  (req, res, next) => {
	console.log(req.body)
	// objectmapper.mapCommentToDatabase(req.body);
	CommentModel.insertToDb(req.body)
	.then(() => {
		res.json({message: "this worked?"});
	})
	.catch(error => {
		res.json({message: error.message});
	})
});

module.exports = router;
