class Pledge < ActiveRecord::Base
  before_destroy :destroyable?
  #before_create :project_active?

  belongs_to :user
  belongs_to :project
  belongs_to :reward

  def destroyable?
    (self.created_at + 24.hours) > Time.now
  end

  def project_active?
    self.project.active?
  end

  def due
    self.project.success_and_closed && (self.paid == false)
  end

  
end

