class Project < ActiveRecord::Base
  belongs_to :user
  belongs_to :category
  has_many :pledges
  has_many :pictures
  has_many :rewards
end
