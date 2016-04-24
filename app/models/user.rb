class User < ActiveRecord::Base

  has_many :tables
  validates :identifier, presence: true, uniqueness: true

end