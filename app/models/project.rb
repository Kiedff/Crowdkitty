class Project < ActiveRecord::Base

  belongs_to :user
  belongs_to :category
  has_many :pledges, dependent: :destroy
  has_many :pictures, dependent: :destroy
  has_many :rewards, dependent: :destroy
  has_many :comments, dependent: :destroy

  def self.sort_by_pledges(projects)
    projects.sort_by {|p| p.pledges.count }.reverse
  end

  def self.sort_by_finishing_soon(projects)
    projects.sort_by{ |project| project.days_remaining }.select{|project| project.days_remaining >= 0}
  end

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

  def days_remaining
    (self.end_date - self.start_date).to_i
  end

  def active?
    self.days_remaining > 0
  end

  def success
    self.total_raised >= self.target
  end

  def failed
    (self.active? == false) && (self.success == false)
  end

end
