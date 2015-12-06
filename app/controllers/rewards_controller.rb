class RewardsController < ApplicationController

  def create
      reward = Reward.new(reward_params.merge(project_id:params[:project_id]))
      project = Project.find(params[:project_id])
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
