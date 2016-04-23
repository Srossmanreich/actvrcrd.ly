get '/' do
	if session[:user_id]
		redirect "/posts"
	else
		erb :landing
	end
end

post '/create' do
  user = User.new(first_name: params[:first_name], last_name: params[:last_name], username: params[:username], email: params[:email], password: params[:password])
  user.save
  if user.save
  	session[:user_id] = user.id
    redirect "/"
   else
   	redirect "/"
  end
end

post '/login' do
	user = User.find_by(username: params[:username])
	if user && user.password == params[:password]
    	session[:user_id] = user.id
		redirect "/posts"
	else
		redirect "/"
	end
end

get '/logout' do
	session.clear
	redirect '/'
end

get '/posts' do
  @questions = Question.all
	  if session[:user_id]
	  	@id = "/#{session[:user_id]}"
	  else
	  	@id = ""
	  end
  erb :index
end

post '/posts' do
	if request.xhr?
		user_id = session[:user_id]


		question = Question.new(title: params[:title],content: params[:content], user_id: user_id)
		if question.save
	      status 200
	      erb :'_postlist', layout: false, locals: {question: question}
	    else
	      status 422
	    end
	end
end


get '/posts/:id' do
  @post = Question.find(params[:id])
  @id = "/#{session[:user_id]}"
  erb :post
end

get '/user/:id' do
	@user = User.find(params[:id])
	@questions = @user.questions
	erb :profile
end


post '/posts/upvote' do
  if request.xhr?
    @post = Question.find(params[:id])
    @post.votes << Vote.create(value: 1)
    content_type :json
    {points: @post.points}.to_json
  end
end

post '/posts/downvote' do
  if request.xhr?
    @post = Question.find(params[:id])
    @post.votes[-1].delete
    content_type :json
    {points: @post.points}.to_json
  end
end
# post '/posts/:id/vote' do
#   if request.xhr?
#     post = Post.find(params[:id])
#     post.votes.create(value: 1)
#     content_type :json
#       { points: post.points }.to_json
#   end
# end

# delete '/posts/:id' do
#   if request.xhr?
#     Post.delete(params[:id])
#     return "success"
#   end
# end

# post '/posts' do
#   if request.xhr?
#     post = Post.new( title: params[:title],
#                  username: Faker::Internet.user_name,
#                  comment_count: rand(1000) )
#     if post.save
#       posts = []
#       posts << post
#       status 200
#       erb :_articleview, layout: false, locals: {posts: posts}
#     else
#       status 422
#     end
#   end
# end


# get '/post/:id' do
#   @post = Post.find(params[:id])
#   erb :post
# end

# get '/:link' do
#   if request.xhr?
#     link = params[:link]
#     case link
#       when "new"
#         posts = Post.all.order(created_at: :DESC)
#       when "comments"
#         posts = Post.all.order(comment_count: :DESC)
#       when "popular"
#         posts = Post.all.order(votes_count: :DESC)
#     end
#     erb :_articleview, layout: false, locals: {posts: posts}
#   end
# end
