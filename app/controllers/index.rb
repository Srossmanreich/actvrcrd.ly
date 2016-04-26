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

	@associations = @user.relationships
	num_rel = @associations.count

	if @associations.find_by(assoc: "has_belongs_many")
		@habtm_assoc = @associations.where("assoc = ?", "has_belongs_many")
		@habtm_assoc.each do |rel|
			origin_t = @tables.find(rel.origin_id)
			target_t = @tables.find(rel.target_id)
			habtm_table = Table.create(name: "#{origin_t.name}_#{target_t.name}", user_id: @user.id)

			or_name = origin_t.name.downcase.singularize
			ta_name = target_t.name.downcase.singularize

			Column.create(name: "#{or_name}_id", category: "integer", foreignkey?: 1, presence?: 0, unique?: 0, table_id: habtm_table.id)

			Column.create(name: "#{ta_name}_id", category: "integer", foreignkey?: 1, presence?: 0, unique?: 0, table_id: habtm_table.id)
		end

	end

	erb :code
end



