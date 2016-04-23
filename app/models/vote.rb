class Vote < ActiveRecord::Base

  belongs_to :question, counter_cache: true
  belongs_to :answer, counter_cache: true
  belongs_to :user
  belongs_to :votable, polymorphic: true, counter_cache: true


end