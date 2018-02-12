var express = require('express');
var router = express.Router();

var CommentModel = require('../models/CommentModel');

/* GET home page. */
router.post('/',  (req, res, next) => {
	console.log(req.body)
	CommentModel.insertToDb(req.body)
	.then(() => {
		res.status(200).json({message: "this worked?"});
	})
	.catch(error => {
		res.status(500).json({error: error.message});
	})
});

module.exports = router;
