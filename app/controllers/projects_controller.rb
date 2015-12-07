class ProjectsController < ApplicationController
  load_and_authorize_resource

  def new
    @project = Project.new
  end

  def create
      project = Project.new(project_params)

      project.user_id = current_user.id if current_user
      project.end_date = Date.today + project.days
      if project.save
        flash[:success] = "Project created! Good luck!"

        redirect_to project
      else
        render 'new'
      end

  end
  
  def index
    @category_id = params[:category_id]
    if @category_id == 'all'
      @projects = Project.search(params[:search])
    elsif @category_id
      @projects = Project.search(params[:search]).select {|p| p.category_id == @category_id.to_i}
    else
      @projects = Project.search(params[:search])
    end
    @search = params[:search]
    @categories = Category.all
  end

  def show
    @project = Project.find(params[:id])
    @reward = Reward.new
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
    params.require(:project).permit(:name, :description, :user_id, :target, :end_date, :location, :summary, :category_id, :search, :days)
  end

  def new
    @project = Project.new
  end

end
