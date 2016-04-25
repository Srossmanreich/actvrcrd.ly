class CreateAssociationsTable < ActiveRecord::Migration
  def change
  	create_table :associations do |t|
      t.integer :origin_id, index: true
      t.string :association
      t.integer :target_id, index: true
      t.timestamps null: false
    end
  end
end
