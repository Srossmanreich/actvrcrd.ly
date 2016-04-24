get '/' do
	@random = (0...10).map { (65 + rand(26)).chr }.join.downcase
	session[:identifier] = @random
	erb :landing
end

get '/:id' do 
	@id = params[:id]
	User.create(identifier: @id)
	erb :index
end

post '/:id' do 
	puts params
	user = User.find_by('identifier = ?',params[:id])
	table = Table.create(name: params[:tablename], user_id: user.id)

end