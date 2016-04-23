class CreateVotesTable < ActiveRecord::Migration
  def change
    create_table :votes do |t|
      t.integer :value
      t.integer :user_id, index: true
      t.integer :votable_id, index: true
      t.string :votable_type
    end
  end
end