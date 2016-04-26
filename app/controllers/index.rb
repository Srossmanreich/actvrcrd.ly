get '/' do
	session.clear
	@random = SecureRandom.uuid
	session[:identifier] = @random
	erb :landing
end

get '/:id' do 
	@id = params[:id]
	user = User.create(identifier: @id)
	erb :index
end

post '/:id' do 

	@id = params[:id]
	col_count = params[:colcount].to_i
	array = Array(1..col_count)

	user = User.find_by('identifier = ?',params[:id])
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
	@user_tables = user.tables
	content_type :json
    send.to_json

end

post '/:id/code' do 
	id = params[:id]
	assoc_nums = params.keys[-4].split("-")[0].to_i

	@user = User.find_by('identifier = ?',id)
	@tables = @user.tables 
	@associations = @user.relationships

	num_rel = @associations.count
	num_tabs = @tables.count

	array = Array(1..assoc_nums)

	array.each do |num|

		ori_key = "#{num}-origin"
		rel_key = "#{num}-rel"
		tar_key = "#{num}-target"
		con_key = "#{num}-through"
		cha_key = "#{num}-channel"

		origin = params[ori_key]
		relation = params[rel_key]
		target = params[tar_key]
		connector = params[con_key]
		channel = params[cha_key]

		ori_tab = @tables.find_by(name:origin)
		tar_tab = @tables.find_by(name:target)
		
		if @tables.find_by(name:channel)
			cha_tab = @tables.find_by(name:channel).id
		else
			cha_tab = 0
		end

		Relationship.create(origin_id:ori_tab.id,assoc:relation,target_id:tar_tab.id,connector:connector,channel_id:cha_tab,user_id:@user.id)
	end

	erb :code
end



