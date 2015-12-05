class Reward < ActiveRecord::Base
  belongs_to :project
  has_many :users
  has_many :pledges
end
