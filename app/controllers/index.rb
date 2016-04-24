get '/' do
	@random = (0...10).map { (65 + rand(26)).chr }.join.downcase
	erb :landing
end

get '/:id' do 
	id = params[:id]
	erb :index
end