class PledgesController < ApplicationController

  def create
    pledge = Pledge.new(pledge_params.merge( user_id: current_user.id, reward_id:params[:reward_id], project_id: params[:project_id] ))
    pledge.paid = false
    if pledge.reward_id
    reward_project_id = Reward.where(id: pledge.reward_id).first.project_id
    pledge.project_id = reward_project_id
  end
    
    if pledge.save
      flash[:success] = "Pledged successfully!"
      redirect_to :back
    else
      flash[:error] = "Pledge failed"
      redirect_to :back
    end
  end

  def show
    @pledge = Pledge.find(params[:id])
  end

  def destroy
    Pledge.find(params[:id]).destroy
    redirect_to(user_path(current_user))
  end

  def edit
    pledge = Pledge.find(params[:id])
    pledge.paid = true
    pledge.save
    redirect_to(user_path(current_user))
  end

  private
  def pledge_params
    params.require(:pledge).permit(:value, :project_id, :user_id, :reward_id)
  end

end
