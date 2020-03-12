PRAGMA foreign_keys = ON;

DROP TABLE IF EXISTS question_follows;
DROP TABLE IF EXISTS question_likes;
DROP TABLE IF EXISTS replies;
DROP TABLE IF EXISTS questions;
DROP TABLE IF EXISTS users;

CREATE TABLE users(
  id INTEGER PRIMARY KEY,
  fname TEXT NOT NULL,
  lname TEXT NOT NULL

);


CREATE TABLE questions (
  id INTEGER PRIMARY KEY,
  title TEXT NOT NULL,
  body TEXT,
  associated_author_id INTEGER NOT NULL,
  FOREIGN KEY (associated_author_id) REFERENCES users(id)
);



CREATE TABLE question_follows(
  user_id INTEGER NOT NULL,
  question_id INTEGER NO NULL,

  FOREIGN KEY (user_id) REFERENCES users(id),
  FOREIGN KEY (question_id) REFERENCES questions(id)
);


CREATE TABLE replies(
  id INTEGER PRIMARY KEY,
  body TEXT NOT NULL,
  user_id INTEGER NOT NULL,
  parent_id INTEGER, 
  question_id INTEGER NOT NULL,

  FOREIGN KEY (user_id) REFERENCES users(id),
  FOREIGN KEY (parent_id) REFERENCES replies(id),
  FOREIGN KEY (question_id) REFERENCES questions(id)

);


CREATE TABLE question_likes (
  question_id INTEGER NOT NULL,
  user_id INTEGER NOT NULL,

  FOREIGN KEY (question_id) REFERENCES questions(id),
  FOREIGN KEY (user_id) REFERENCES users(id)

);

INSERT INTO
  users (fname,lname)
VALUES
  ('Eric', 'Chen'),
  ('Javier', 'Castro'),
  ('Mike', 'Madsen'),
  ('Helen', 'Ju');


INSERT INTO
  questions (title,body,associated_author_id)
VALUES
  ('Question 1', 'How are you?', (SELECT id FROM users WHERE fname = 'Eric')),
  ('Question 2', 'What is your name?', 2),
  ('Question 3', 'What is your favorite color?', 3);



INSERT INTO
  question_follows (user_id, question_id)
VALUES
  ((SELECT id FROM users WHERE fname = 'Javier'), (SELECT id FROM questions WHERE title='Question 1'));

INSERT INTO
  replies (body,user_id,parent_id,question_id)
VALUES
  ('Fine', (SELECT id FROM users WHERE fname = 'Javier'), NULL , 1);

INSERT INTO
  replies (body,user_id,parent_id,question_id)
VALUES
  ('Good to hear', (SELECT id FROM users WHERE fname = 'Eric'), (SELECT id FROM replies WHERE body = 'Fine') , 1 );

INSERT INTO
  replies (body,user_id,parent_id,question_id)
VALUES
  ('Good to hear 2', (SELECT id FROM users WHERE fname = 'Eric'), (SELECT id FROM replies WHERE body = 'Fine') , 1 );

INSERT INTO
  replies (body,user_id,parent_id,question_id)
VALUES
  ('Great', (SELECT id FROM users WHERE fname = 'Javier'), (SELECT id FROM replies WHERE body = 'Good to hear') , 1 );

INSERT INTO
  question_follows (user_id,question_id)
VALUES
  (3,1),
  (4,1),
  (2,3),
  (4,3);







   
