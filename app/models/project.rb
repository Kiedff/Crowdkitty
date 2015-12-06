class Project < ActiveRecord::Base

  belongs_to :user
  belongs_to :category
  has_many :pledges
  has_many :pictures
  has_many :rewards

  def self.search(term)
    Project.where("name ILIKE (?)", "%#{term}%").to_a
  end

  def total_raised

    pledges = Pledge.where(project_id: self.id)
    pledge_values = pledges.map do |pledge| pledge.value 
    end
    pledge_values.sum
  end

  def funds_needed
    self.target - self.total_raised
  end

end
