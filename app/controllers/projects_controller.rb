class ProjectsController < ApplicationController

  def new
    @project = Project.new
  end

  def create
      project = Project.new(project_params)
      project.user_id = current_user.id if current_user
      if project.save
        flash[:success] = "Project created! Good luck!"
        redirect_to project
      else
        render 'new'
      end
  end
  
  def index
    @projects = Project.all
  end

  def show
    @project = Project.find(params[:id])
  end

  private
  def project_params
    params.require(:project).permit(:name, :description, :user_id, :target, :end_date, :location, :summary, :category_id)
  end

end
