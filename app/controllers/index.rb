get '/' do
	erb :index
end

post '/new' do 
	random = (0...10).map { (65 + rand(26)).chr }.join.downcase
	redirect "/#{random}"
end

get '/:id' do 
	id = params[:id]
end