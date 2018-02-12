var express = require('express');
var router = express.Router();

var CommentModel = require('../models/CommentModel');

/* POST comment */
router.post('/',  (req, res, next) => {
	CommentModel.insertToDb(req.body)
	.then(() => {
		res.sendStatus(200);
	})
	.catch(error => {
		res.status(500).json({error: error.message});
	})
});

module.exports = router;
