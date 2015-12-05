class ProjectsController < ApplicationController
  load_and_authorize_resource

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
    # binding.pry
    if params[:category_id]
      @projects = Project.where(category_id: params[:category_id])
    else
      @projects = Project.all
    end
    @categories = Category.all
  end

  def show
    @project = Project.find(params[:id])
  end

  def destroy
    Project.find(params[:id]).destroy
    redirect_to(projects_path)
  end

  def edit
    @project = Project.find(params[:id])
  end

  def update
    project = Project.find(params[:id])
    project.update(project_params)
    redirect_to(project_path(project))
  end

  private
  def project_params
    params.require(:project).permit(:name, :description, :user_id, :target, :end_date, :location, :summary, :category_id)
  end

  def new
    @project = Project.new
  end

end
