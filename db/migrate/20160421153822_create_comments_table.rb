class CreateCommentsTable < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.string :title, :content
      t.integer :user_id, index: true
      t.integer :commentable_id, index: true
      t.string :commentable_type
      t.integer :votes_count, default: 0
      t.timestamps
    end
  end
end
