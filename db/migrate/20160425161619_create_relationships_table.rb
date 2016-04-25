class CreateRelationshipsTable < ActiveRecord::Migration
  def change
  	create_table :relationships do |t|
      t.integer :origin_id, index: true
      t.string :assoc
      t.integer :target_id, index: true
      t.timestamps null: false
    end
  end
end