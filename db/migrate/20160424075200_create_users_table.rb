class CreateUsersTable < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :identifier
      t.timestamps null: false
    end
  end
end
