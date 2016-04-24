get '/' do
	@random = (0...10).map { (65 + rand(26)).chr }.join.downcase
	session[:identifier] = @random
	erb :landing
end

get '/:id' do 
	id = params[:id]
	User.create(identifier: id)
	erb :index
end