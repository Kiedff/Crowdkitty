class PledgesController < ApplicationController

  def create
    
    pledge = Pledge.new(pledge_params.merge( user_id: current_user.id, reward_id:params[:reward_id] ))

    reward_project_id = Reward.where(id: pledge.reward_id).first.project_id
    pledge.project_id = reward_project_id
    
    if pledge.save
      flash[:success] = "Pledged successfully!"
      redirect_to :back
    else
      render 'new'
    end
  end

  private
  def pledge_params
    params.require(:pledge).permit(:value, :project_id, :user_id, :reward_id)
  end

end
