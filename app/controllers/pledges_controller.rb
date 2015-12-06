class PledgesController < ApplicationController

  def create
    
    pledge = Pledge.new(pledge_params.merge( user_id: current_user.id, reward_id:params[:reward_id] ))

    p_id = Pledge.joins(:reward).where(:rewards => { :id => pledge.reward_id})
    pledge.project_id = p_id.first.project_id
  
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
