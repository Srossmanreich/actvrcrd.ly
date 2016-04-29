get '/' do
	session.delete(:identifier)
	@random = SecureRandom.uuid
	erb :landing
end

get '/:id' do 
	@id = params[:id]
	if session[:identifier] == @id
		user = User.find_by(identifier: @id)
	else
		session[:identifier] = @id
		user = User.create(identifier: @id)
	end

	if user.tables
		@tables = user.tables
	else
		@tables = []
	end

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

		if params["#{index}-poly"]
			poly = 1
		else
			poly = 0
		end

		Column.create(name: params["#{index}-header"], category: params["#{index}-type"], foreignkey?: fkey, presence?: pres, unique?: uniq, polymorphic?: poly, table_id: table.id)
	end

	send = {columns: table.columns, table_id: table.id, tablename: params[:tablename]}
	@user_tables = user.tables
	content_type :json
    send.to_json

end

post '/:id/code' do 
	@id = params[:id]
	
	if params.keys.length > 3
		assoc_nums = params.keys[-4].split("-")[0].to_i
		else
		assoc_nums = 0
	end

	@user = User.find_by('identifier = ?',@id)
	@tables = @user.tables 
	num_tabs = @tables.count

	if assoc_nums >= 1
		array = Array(1..assoc_nums)
	else
		array = []
	end

	if array.length >= 1
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
	end

	@associations = @user.relationships

	if @associations.find_by(assoc: "has_belongs_many")
		@habtm_assoc = @associations.where("assoc = ?", "has_belongs_many")
		@habtm_assoc.each do |rel|
			origin_t = @tables.find(rel.origin_id)
			target_t = @tables.find(rel.target_id)
			habtm_table = Table.create(name: "#{origin_t.name}_#{target_t.name}", user_id: @user.id)

			or_name = origin_t.name.downcase.singularize
			ta_name = target_t.name.downcase.singularize

			Column.create(name: "#{or_name}_id", category: "integer", foreignkey?: 1, presence?: 0, unique?: 0, polymorphic?: 0, table_id: habtm_table.id)

			Column.create(name: "#{ta_name}_id", category: "integer", foreignkey?: 1, presence?: 0, unique?: 0, polymorphic?: 0, table_id: habtm_table.id)
		end

	end

		redirect "/#{@id}/code"

end

get '/:id/code' do
	@id = params[:id]

	@user = User.find_by('identifier = ?',@id)
	@tables = @user.tables 
	@associations = @user.relationships

	# Logic helpers

	def ass_target(id)
		@associations.where(target_id: id)
	end

	def ass_origin(id)
		@associations.where(origin_id: id)
	end

	def ass_check(rel,result)
		rel.assoc == result
	end

	def ass_not(rel,result)
		rel.assoc != result
	end

	def con_check(rel,result)
		rel.connector == result
	end

	def tab_name(tables,rel,option=1)
		case option
			when 1
				return tables.find(rel.origin_id).name.downcase.singularize
			when 2
				return tables.find(rel.origin_id).name.downcase
			when 3
				return tables.find(rel.target_id).name.downcase.singularize
			when 4
				return tables.find(rel.target_id).name.downcase
			when 5
				return tables.find(rel.channel_id).name.downcase.singularize
			when 6
				return tables.find(rel.channel_id).name.downcase
		end
	end

	def poly_name(tables,rel)
		tables.find(rel.origin_id).columns.where(polymorphic?: 1)[0].name
	end

	@poly_check = []

	def table_split(table)
		if table.name.include?("_")
			array = table.name.split("_")
			array[1].capitalize!
			array.join("")
		else
			table.name.capitalize
		end
	end

	erb :code

end

delete '/:id' do

	table = Table.find(params[:table_id])
	user = User.find(table.user_id)

	Table.destroy(params[:table_id])

	if user.tables.length < 1
		all_gone = 1
	else
		all_gone = 0
	end
	
	@associations = []
	
	if Relationship.where(origin_id: params[:table_id])
		Relationship.where(origin_id: params[:table_id]).each do |rel|
			@associations << rel.id
		end
	end

	if Relationship.where(target_id: params[:table_id])
		Relationship.where(target_id: params[:table_id]).each do |rel|
			@associations << rel.id
		end
	end

	if Relationship.where(channel_id: params[:table_id])
		Relationship.where(channel_id: params[:table_id]).each do |rel|
			@associations << rel.id
		end
	end

	if @associations.length > 0
		@remove = @associations.uniq
			@remove.each do |rel_id|
				Relationship.destroy(rel_id)
			end
	end

	send = {table_id: params[:table_id], all_gone: all_gone}
	content_type :json
    send.to_json

end


