class Table < ActiveRecord::Base

  belongs_to :user
  has_many :columns
  validates :name, presence: true

end