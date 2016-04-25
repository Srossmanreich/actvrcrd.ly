class Table < ActiveRecord::Base

  belongs_to :user
  has_many :columns
  belongs_to :origin, :class_name => 'Association'
  belongs_to :target, :class_name => 'Association'
  
  validates :name, presence: true

end