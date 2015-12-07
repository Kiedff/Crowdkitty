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
    @request_type = params[:request_type]
    @projects = Project.search(params[:search])
    @search = params[:search]
    @categories = Category.all

    case @request_type 
    when 'most_popular'
      @projects = Project.sort_by_pledges(@projects)
    when 'finishing_soon'
      @projects = Project.sort_by_finishing_soon(@projects)
    end

    if @category_id && @category_id != 'all'
      @projects = @projects.select {|p| p.category_id == @category_id.to_i}
    end
    
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
    params.require(:project).permit(:name, :description, :user_id, :target, :end_date, :location, :summary, :category_id, :search, :days, :request_type)
  end

  def new
    @project = Project.new
  end

end
