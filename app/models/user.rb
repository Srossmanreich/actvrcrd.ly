class User < ActiveRecord::Base

  has_many :tables
  has_many :relationships
  validates :identifier, presence: true, uniqueness: true

end