class RewardsController < ApplicationController

  def new
    raise
    @project = current_user.projects.last
    @reward = Reward.new
  end

  def create
      reward = Reward.new(reward_params)
      reward.project_id = current_user.projects.last.id
      project = current_user.projects.last
      if reward.save
        flash[:success] = "Reward Successfully Created"
        redirect_to project
      else
        render 'new'
      end
  end

  private
  def reward_params
    params.require(:reward).permit(:description, :project_id, :value, :quantity, :delivery, :ships_to)
  end

end
