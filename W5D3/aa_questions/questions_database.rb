require 'sqlite3'
require 'singleton'

class QuestionsDBConnection < SQLite3::Database
  include Singleton
  def initialize
    super('questions.db')
    self.type_translation = true
    self.results_as_hash = true
  end
end

class Users
  attr_accessor :id, :fname, :lname

  def self.all
    data = QuestionsDBConnection.instance.execute("SELECT *  FROM users")
    data.map {|datum| Users.new(datum)}
  end

  def self.find_by_id(id)
    users = QuestionsDBConnection.instance.execute(<<-SQL, id)
      SELECT
        *
      FROM 
        users
      WHERE
      id = ?
    SQL
    return nil unless users.length > 0

    Users.new(users.first)
  end

  def self.find_by_name(fname,lname)
    users = QuestionsDBConnection.instance.execute(<<-SQL, fname, lname)
      SELECT
        *
      FROM 
        users
      WHERE
      fname = ? AND lname = ?
    SQL
    return nil unless users.length > 0

    users.map {|user| Users.new(user)}
  end

  def initialize(options)
    @id = options['id']
    @fname = options['fname']
    @lname = options['lname']
  end

  def authored_questions
    Questions.find_by_author_id(self.id)
  end

  def authored_replies
    Replies.find_by_user_id(self.id)
  end
end

class Questions 

  attr_reader :associated_author_id, :id

    def self.find_by_author_id(user_id)
      questions = QuestionsDBConnection.instance.execute(<<-SQL, user_id)
      SELECT
        *
      FROM 
        questions
      WHERE
      associated_author_id = ?
    SQL
    return nil unless questions.length > 0

    questions.map {|question| Questions.new(question)}
  end

  def self.all
    data = QuestionsDBConnection.instance.execute("SELECT *  FROM questions")
    data.map {|datum| Questions.new(datum)}
  end

  def initialize(options)
    @id = options['id']
    @title = options['title']
    @body = options['body']
    @associated_author_id = options['associated_author_id']
  end

  def authored 
    user = QuestionsDBConnection.instance.execute(<<-SQL, associated_author_id)
      SELECT
        *
      FROM 
        users
      WHERE
        id = ?
    SQL
    user
  end

  def replies
    Replies.find_by_question_id(self.id)
  end

end

class QuestionFollows

  def self.find_by_id(user_id,question_id)
      question_follows = QuestionsDBConnection.instance.execute(<<-SQL, user_id, question_id)
      SELECT
        *
      FROM 
        question_follows
      WHERE
      user_id = ? AND question_id = ?
    SQL
    return nil unless question_follows.length > 0

    QuestionFollows.new(question_follows.first)
  end

  def self.all
    data = QuestionsDBConnection.instance.execute("SELECT *  FROM question_follows")
    data.map {|datum| QuestionFollows.new(datum)}
  end

  def self.followers_for_question_id(question_id)
      followers = QuestionsDBConnection.instance.execute(<<-SQL, question_id)
      SELECT
        *
      FROM 
        users
      JOIN
        question_follows
        ON
        users.id = question_follows.user_id
      WHERE
        question_id = ?
    SQL
    return nil unless followers.length > 0

    followers.map {|follower| Users.new(follower)}
  end

  def self.followed_questions_for_user_id(user_id)
      questions = QuestionsDBConnection.instance.execute(<<-SQL, user_id)
      SELECT
        *
      FROM 
        questions
      JOIN
        question_follows
        ON
        questions.id = question_follows.question_id
      WHERE
        user_id = ?
    SQL
    return nil unless questions.length > 0

    questions.map {|question| Questions.new(question)}
  end

  def initialize(options)
    @user_id = options['user_id']
    @question_id = options['question_id']
  end



end

class Replies

  attr_reader :id, :user_id, :body, :parent_id, :question_id

  def self.all
    data = QuestionsDBConnection.instance.execute("SELECT *  FROM replies")
    data.map {|datum| Replies.new(datum)}
  end

  def self.find_by_user_id(user_id)
    replies = QuestionsDBConnection.instance.execute(<<-SQL, user_id)
      SELECT
        *
      FROM 
        replies
      WHERE
      user_id = ?
    SQL
    return nil unless replies.length > 0

    replies.map {|reply| Replies.new(reply)}
  end

  def self.find_by_question_id(question_id)
    replies = QuestionsDBConnection.instance.execute(<<-SQL, question_id)
      SELECT
        *
      FROM 
        replies
      WHERE
      question_id = ?
    SQL
    return nil unless replies.length > 0

    replies.map {|reply| Replies.new(reply)}
  end

  def initialize(options)
    @id = options['id']
    @body = options['body']
    @user_id = options['user_id']
    @parent_id = options['parent_id']
    @question_id = options['question_id']
  end

  def author
      user = QuestionsDBConnection.instance.execute(<<-SQL, user_id)
      SELECT
        *
      FROM 
        users
      WHERE
        id = ?
    SQL
    user
  end

  def question
      ques = QuestionsDBConnection.instance.execute(<<-SQL, question_id)
      SELECT
        *
      FROM 
        questions
      WHERE
        id = ?
    SQL
    ques
  end

  def parent_reply
      parent = QuestionsDBConnection.instance.execute(<<-SQL, parent_id)
      SELECT
        *
      FROM 
        replies
      WHERE
        id = ?
    SQL
    parent
  end

  def child_replies
    reps = Replies.all
    reps.select {|reply| reply.parent_id == self.id}
  end

end

class QuestionLikes

end