class Pledge < ActiveRecord::Base
  before_destroy :destroyable?
  before_create :project_active?

  belongs_to :user
  belongs_to :project
  belongs_to :reward

  def destroyable?
    created_at < 1.day.ago
  end

  def project_active?
    self.project.active?
  end
end

