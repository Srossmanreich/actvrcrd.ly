class Association < ActiveRecord::Base

  has_many :origins, :class_name => 'Table', :foreign_key => 'origin_id'
  has_many :targets, :class_name => 'Table', :foreign_key => 'target_id'

  validates :origin_id, presence: true
  validates :association, presence: true
  validates :target_id, presence: true
  

end