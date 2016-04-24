class CreateColumnsTable < ActiveRecord::Migration
  def change
    create_table :columns do |t|
      t.string :name
      t.string :type
      t.integer :foreignkey?
      t.integer :presence?
      t.integer :unique?
      t.integer :table_id, index: true
      t.timestamps null: false
    end
  end
end
