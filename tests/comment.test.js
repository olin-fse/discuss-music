var request = require('supertest');
var pgp = require('pg-promise')();
var app = require('../app');
var db = require('../db');
var rawdb = require('../db/db')

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
};

let insertComment = () => {
  return db.comment.insert(validComment)
  .catch(error => {
    console.error(error);
  });
};

let insertComments = n => {
  inserts = [];
  for (let i = 0; i < n; i++) {
    inserts.push(insertComment());
  }
  return Promise.all(inserts);
};

let removeComment = id => {
  if (id != null) {
    return db.comment.remove(id)
    .catch(error => {
      console.error(error);
    });
  }
  return;
};

let removeComments = ids => {
  removes = [];
  for (let i = 0; i < ids.length; i++) {
    removes.push(removeComment(ids[i]));
  }
  return Promise.all(removes);
};


beforeAll(() => {
  // clear comments table
  rawdb.none('DELETE FROM comments');
});

afterAll(() => {
  // close database connections
  pgp.end();
});

describe('GET /comment', () => {
  it('should successfully get no comments', () => {
    return request(app).get('/comment')
    .then(response => {
      expect(response.statusCode).toBe(200);
      expect(response.body.length).toBe(0);
    });
  });

  it('should successfully get one comment', () => {
    id = null;
    return insertComment()
    .then(response => {
      id = response.id;
      return request(app).get('/comment');
    })
    .then(response => {
      expect(response.statusCode).toBe(200);
      expect(response.body.length).toBe(1);
      expect(response.body[0]).toMatchObject(validComment);
      expect(response.body[0].id).toBe(id);
    })
    .then(() => {
      return removeComment(id)
    });
  });

  it('should successfully get multiple comments', () => {
    n = 5;
    ids = [];
    return insertComments(n)
    .then(response => {
      ids = response.map(insert => insert.id);
      return request(app).get('/comment');
    })
    .then(response => {
      expect(response.statusCode).toBe(200);
      expect(response.body.length).toBe(n);
      for (let i = 0; i < n; i++) {
        const comment = response.body[i];
        expect(comment).toMatchObject(validComment);
        expect(ids.indexOf(comment.id)).toBeGreaterThan(-1);
      }
    })
    .then(() => {
      return removeComments(ids)
    });
  });
});

describe('POST /comment', () => {
  id = null;

  it('should succeed with a valid comment', () => {
    return request(app).post('/comment').send(validComment)
    .then(response => {
      expect(response.statusCode).toBe(201);
      expect(typeof(response.body.id)).toBe('number');
      id = response.body.id;
    })
    .then(() => {removeComment(id)});
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
  it('should successfully get specific existing comments', () => {
    n = 3;
    ids = [];
    return insertComments(n)
    .then(response => {
      ids = response.map(insert => insert.id);
      gets = [];
      for (let i = 0; i < ids.length; i++) {
        gets.push(request(app).get('/comment/'+ids[i]));
      }
      return Promise.all(gets);
    })
    .then(responses => {
      for (let i = 0; i < n; i++) {
        const comment = responses[i].body;
        expect(responses[i].statusCode).toBe(200);
        expect(comment).toMatchObject(validComment);
        expect(comment.id).toEqual(ids[i]);
      }
    })
    .then(() => {
      return removeComments(ids)
    });
  });

  it('should error with an id for a nonexistent comment', () => {
    n = 3;
    ids = [];
    return insertComments(n)
    .then(response => {
      ids = response.map(insert => insert.id);
      return request(app).get('/comment/'+(ids[ids.length-1]+1));
    })
    .then(response => {
      expect(response.statusCode).toBe(404);
      expect(response.body).toHaveProperty('error');
    })
    .then(() => {
      return removeComments(ids)
    });
  });
});
