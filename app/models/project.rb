class Project < ActiveRecord::Base

  belongs_to :user
  belongs_to :category
  has_many :pledges
  has_many :pictures
  has_many :rewards

  def self.search(term)
    Project.where("name ILIKE (?)", "%#{term}%").to_a
  end

end
