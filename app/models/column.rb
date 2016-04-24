class Column < ActiveRecord::Base

  belongs_to :table
  validates :name, presence: true
  validates :category, presence: true

end