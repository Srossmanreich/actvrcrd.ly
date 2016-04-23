class CreateUserTable < ActiveRecord::Migration
   def change
    create_table :users do |t|
      t.string :username, :first_name, :last_name, :email, :password_hash
      t.timestamps
    end
  end
end

