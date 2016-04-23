class Question < ActiveRecord::Base

  has_many :votes, as: :votable
  has_many :answers
  has_many :comments, as: :commentable
  
  belongs_to :user

  def points
    votes.sum(:value)
  end

  validates :title, :content, presence: true

end
