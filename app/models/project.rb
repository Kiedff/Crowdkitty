class Project < ActiveRecord::Base
  mount_uploader :project_image, ProjectImageUploader

  # before_update :editable?

  belongs_to :user
  belongs_to :category
  has_many :pledges, dependent: :destroy
  has_many :pictures, dependent: :destroy
  has_many :rewards, dependent: :destroy
  has_many :comments, dependent: :destroy

  validates_presence_of :name, :summary, :description, :target, :start_date, :category, :location
  validates_inclusion_of :days, :in => -1..150

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
    pledge_values = pledges.map {|pledge| pledge.value} || 0
    pledge_values.compact.sum
  end
  

  def funds_needed
    self.target - self.total_raised
  end

  def days_remaining
    (self.end_date - Date.today).to_i 
  end

  def active?
    (self.days_remaining > 0) && ((Date.today - self.start_date) > 0)
  end

  def not_open_yet
    Date.today < self.start_date
  end

  def success
    self.total_raised >= self.target 
  end

  def success_and_closed
    (self.total_raised >= self.target) && (self.active? == false) 
  end


  def failed
    (self.active? == false) && (self.success == false)
  end

  def editable?
    self.not_open_yet
  end

  def human_readable_date
    end_date.strftime('%A, %d %B %Y')
  end

  def human_readable_end_date
    end_date.strftime('%d %B %Y')
  end

  def human_readable_start_date
    start_date.strftime('%d %B %Y')
  end

  def current_percentage
    (self.total_raised.to_f/self.target.to_f) * 100
  end
end
