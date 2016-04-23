class Tag < ActiveRecord::Base
  validates :description, :presence => true
  has_and_belongs_to_many :questions
end