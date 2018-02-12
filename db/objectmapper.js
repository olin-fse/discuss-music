//make database call
//map info from database to js object
//pass js object to router

//and vice versa

//take json
//map json to database obj

const db = require('./index')

export const mapCommentToDatabase = (comment) => {
	console.log(comment)
	db.none('INSERT INTO comments (user_id, song_id, group_id, body) VALUES(${user_id}, ${song_id}, ${group_id}, ${body})', comment)
		.then(()=>{
			console.log('worked')
		})
		.catch(error => {
			console.log(error)
		});
}

export const other 
