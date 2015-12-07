class Pledge < ActiveRecord::Base
  before_destroy :destroyable?

  belongs_to :user
  belongs_to :project
  belongs_to :reward

  def destroyable?
    created_at < 1.day.ago
  end
end

