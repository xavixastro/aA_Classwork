# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.create([{username: 'xavicastro'}, {username:'mikethepugsf'}])
User.create([{username: 'userA'}])
User.create([{username: 'userB'}])
Poll.create([{title: 'Poll 1', user_id: User.first.id}, {title: 'Poll 2', user_id: User.last.id}, ])
Question.create([{text: 'Question 1?', poll_id: Poll.first.id}, {text: 'Question 2?', poll_id: Poll.first.id}])
Question.create([{text: 'Question 3?', poll_id: Poll.last.id}, {text: 'Question 4?', poll_id: Poll.last.id}])
AnswerChoice.create([{text: 'Option A', question_id: Question.first.id}, {text: 'Option B', question_id: Question.first.id}])
AnswerChoice.create([{text: 'Option C', question_id: Question.first.id}, {text: 'Option D', question_id: Question.first.id}])
AnswerChoice.create([{text: 'Option I', question_id: Question.last.id}, {text: 'Option II', question_id: Question.last.id}])
AnswerChoice.create([{text: 'Option III', question_id: Question.last.id}, {text: 'Option IV', question_id: Question.last.id}])
Response.create([{user_id: User.where(username:'userA').first.id, answer_choice_id: AnswerChoice.where(text:'Option A').first.id}])
Response.create([{user_id: User.where(username:'userB').first.id, answer_choice_id: AnswerChoice.where(text:'Option C').first.id}])
Response.create([{user_id: User.where(username:'userA').first.id, answer_choice_id: AnswerChoice.where(text:'Option II').first.id}])
Response.create([{user_id: User.where(username:'userB').first.id, answer_choice_id: AnswerChoice.where(text:'Option II').first.id}])






