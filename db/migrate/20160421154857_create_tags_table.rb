class CreateTagsTable < ActiveRecord::Migration
   create_table :tags do |t|
      t.string :description
      t.timestamps null: false
    end
end
