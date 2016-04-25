get '/' do
	session.clear
	@random = SecureRandom.uuid
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

	col_count = params[:colcount].to_i
	array = Array(1..col_count)

	user = User.find_by('identifier = ?',params[:id])
	@user_tables = user.tables
	table = Table.create(name: params[:tablename], user_id: user.id)

	array.each do |index|
		
		if params["#{index}-foreignkey"]
			fkey = 1
		else
			fkey = 0
		end

		if params["#{index}-presence"]
			pres = 1
		else
			pres = 0
		end

		if params["#{index}-unique"]
			uniq = 1
		else
			uniq = 0
		end

		Column.create(name: params["#{index}-header"], category: params["#{index}-type"], foreignkey?: fkey, presence?: pres, unique?: uniq, table_id: table.id)
	end

	send = {columns: table.columns, tablename: params[:tablename]}
	content_type :json
	puts send.to_json
    send.to_json

end