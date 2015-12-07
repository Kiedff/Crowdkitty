class PledgesController < ApplicationController

  def new
    @pledge = Pledge.new
    @project = Project.find(params[:project_id])
  end

  def create
    pledge = Pledge.new(pledge_params.merge( user_id: current_user.id, reward_id:params[:reward_id], project_id: params[:project_id] ))
    if pledge.reward_id
    reward_project_id = Reward.where(id: pledge.reward_id).first.project_id
    pledge.project_id = reward_project_id
  end
    
    if pledge.save
      flash[:success] = "Pledged successfully!"
      project = Project.find(params[:project_id])
      redirect_to project
    else
      render 'new'
    end
  end

  private
  def pledge_params
    params.require(:pledge).permit(:value, :project_id, :user_id, :reward_id)
  end

end
