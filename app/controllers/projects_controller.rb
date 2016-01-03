class ProjectsController < ApplicationController

  load_and_authorize_resource

  def new
    @project = Project.new
    @picture = @project.pictures.build

    @cities = Location.all 
  end

  def create
      project = Project.new(project_params)
      project.user_id = current_user.id if current_user
      project.end_date = project.start_date + project.days
      
      respond_to do |format|
        if @project.save
          params[:pictures]['image'].each do |a|
             @picture = @project.pictures.create!(:image => a)
          end
          format.html { redirect_to @project, notice: 'Project was successfully created.' }
        else
          format.html { render action: 'new' }
        end
      end


      # if project.save
      #   flash[:success] = "Project created! Good luck!"

      #   redirect_to project
      # else
      #   render 'new'
      # end
  end
  
  def index
    @category_id = params[:category_id]
    @request_type = params[:request_type]
    @search = params[:search]
    @projects = Project.search(@search).select{|project|project.active?}
    @categories = Category.all
    @cities = Location.pluck(:name)
    @location = params[:location] unless !params[:location] || params[:location].empty?


    case @request_type 
    when 'most_popular'
      @projects = Project.sort_by_pledges(@projects).select{|p|p.pledges.count > 0}
    when 'finishing_soon'
      @projects = Project.sort_by_finishing_soon(@projects)
    end

    if @category_id && @category_id != 'all'
      @projects = @projects.select {|p| p.category_id == @category_id.to_i}
    end

    if @location && @location != 'all'
      @projects = @projects.select {|p| p.location.id == @location.to_i}
    end   
    respond_to do |format|
      format.html
      format.js
      format.json {render :json =>  @projects }
    end
  end

  def show
    
    @project = Project.find(params[:id])
    @pictures = @projects.pictures.all
    @reward = Reward.new

    respond_to do |format|
      format.html
      format.js
    end
  end

  def destroy
    Project.find(params[:id]).destroy
    redirect_to(projects_path)
  end

  def edit
    @project = Project.find(params[:id])
    # needs altered to create using location model
    @cities = Location.all
  end

  def update
    project = Project.find(params[:id])
     project.update(project_params)
    project.end_date = project.start_date + project.days
    project.save
    redirect_to(project_path(project))
  end

  def autocomplete_locations
    locations = Location.for_autocomplete(params[:q])
    render json: locations
  end

  private
  def project_params
    params.require(:project).permit(:name, :description, :user_id, :target, :end_date, :location_id, :summary, :category_id, :search, :days, :request_type, :start_date, :project_image, :location, picture_attributes: [:id, :project_id, :image])
  end

end

