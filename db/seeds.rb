5.times do
  user = User.create!( username: Faker::Internet.user_name,
      first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, email: Faker::Internet.email,
      password: Faker::Internet.password)
end

5.times do
  user_id = rand(User.count)
  question = Question.create!( title: Faker::Company.catch_phrase+"?",
      content: Faker::Company.catch_phrase+"?", user_id: user_id)

  vote_count = rand(100)
  vote_count.times do
    question.votes.create!(value: 1)
  end
end

5.times do
  user_id = rand(User.count)
  question_id = rand(Question.count)
  answer = Answer.create!( title: Faker::Company.catch_phrase,
      content: Faker::Company.catch_phrase, user_id: user_id, question_id: question_id)

  vote_count = rand(100)
  vote_count.times do
    answer.votes.create!(value: 1)
  end
end

5.times do
  user_id = rand(User.count)
  question_id = rand(Question.count)
  comment = Comment.create!( title: Faker::Company.catch_phrase,
      content: Faker::Company.catch_phrase, user_id: user_id, commentable_id: question_id, commentable_type: "Question")

  vote_count = rand(100)
  vote_count.times do
    comment.votes.create!(value: 1)
  end
end

5.times do
  user_id = rand(User.count)
  answer_id = rand(Answer.count)
  comment = Comment.create!( title: Faker::Company.catch_phrase,
      content: Faker::Company.catch_phrase, user_id: user_id, commentable_id: answer_id, commentable_type: "Answer")

  vote_count = rand(100)
  vote_count.times do
    comment.votes.create!(value: 1)
  end
end

