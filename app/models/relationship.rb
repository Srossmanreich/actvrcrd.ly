class Relationship < ActiveRecord::Base

 belongs_to :origin, :class_name => 'Table', :foreign_key => 'origin_id'
 belongs_to :target, :class_name => 'Table', :foreign_key => 'target_id'
 belongs_to :user

 validates :origin_id, presence: true
 validates :assoc, presence: true
 validates :target_id, presence: true
 validates :user_id, presence: true
  

end