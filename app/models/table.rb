class Table < ActiveRecord::Base

  belongs_to :user
  has_many :columns

  has_many :origins, :class_name => 'Relationship', :foreign_key => 'origin_id'
  has_many :targets, :class_name => 'Relationship', :foreign_key => 'target_id'
  
  validates :name, presence: true
  validates :user_id, presence: true

end