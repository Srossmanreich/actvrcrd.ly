class User < ActiveRecord::Base

  validates :identifier, presence: true, uniqueness: true

end