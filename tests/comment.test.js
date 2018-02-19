var request = require('supertest');
var pgp = require('pg-promise')();
var app = require('../app');
var db = require('../db');

let id = null;

let validComment = {
  'userId': 1,
  'songId': 2,
  'groupId': 3,
  'body': 'This is a cool song yo',
};

let invalidComment = {
  'userId': 'three',
  'songId': 2,
  'body': 'This is a cool song yo',
}

afterAll(() => {
  db.comment.remove(id)
  .catch(error => {
    console.log('error deleting comment with id='+id);
    console.log(error);
  })
  .then(pgp.end);
});

describe('POST /comment', () => {
  it('should succeed with a valid comment', () => {
    return request(app).post('/comment').send(validComment)
    .then(response => {
      expect(response.statusCode).toBe(201);
      expect(typeof(response.body.id)).toBe('number');
      id = response.body.id;
    });
  });

  it('should error with an invalid comment', () => {
    return request(app).post('/comment').send(invalidComment)
    .then(response => {
      expect(response.statusCode).toBe(500);
      expect(response.body).toHaveProperty('error');
    });
  });
});

describe('GET /comment/:id', () => {
  it('should successfully retrieve comment', () => {
    return request(app).get('/comment/'+id)
    .then(response => {
      expect(response.statusCode).toBe(200);
      expect(response.body).toMatchObject(validComment);
      expect(typeof(response.body.id)).toBe('number');
      expect(response.body).toHaveProperty('createdOn');
    });
  });

  it('should error with an invalid id', () => {
    return request(app).get('/comment/'+(id+1))
    .then(response => {
      expect(response.statusCode).toBe(404);
      expect(response.body).toHaveProperty('error');
    });
  });
});
