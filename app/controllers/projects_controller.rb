class ProjectsController < ApplicationController

  load_and_authorize_resource

    @@cities = [
  'Aberdeen',
  'Airdrie',
  'Alloa',
  'Arbroath',
  'Ayr',
  'Barrhead',
  'Bathgate',
  'Bearsden',
  'Bellshill',
  'Bishopbriggs',
  'Blantyre',
  'Bonnyrigg',
  'Broxburn',
  'Cambuslang',
  'Clydebank',
  'Coatbridge',
  'Cumbernauld',
  'Dumbarton',
  'Dumfries',
  'Dundee',
  'Dunfermline',
  'East Kilbride',
  'Edinburgh',
  'Elgin',
  'Erskine',
  'Falkirk',
  'Glasgow',
  'Glenrothes',
  'Grangemouth',
  'Greenock',
  'Hamilton',
  'Inverness',
  'Irvine',
  'Johnstone',
  'Kilmarnock',
  'Kilwinning',
  'Kirkcaldy and Dysart',
  'Kirkintilloch',
  'Larkhall',
  'Livingston',
  'Motherwell',
  'Musselburgh',
  'Newton Mearns',
  'Paisley',
  'Penicuik',
  'Perth',
  'Peterhead',
  'Port Glasgow',
  'Renfrew',
  'Rutherglen',
  'St Andrews',
  'Stirling',
  'Viewpark',
  'Wishaw'
  ]

  def new
    @project = Project.new
    @cities = @@cities
  end

  def create
      project = Project.new(project_params)

      project.user_id = current_user.id if current_user
      project.end_date = project.start_date + project.days
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
    @search = params[:search]
    @projects = Project.search(@search).select{|project|project.active?}
    @categories = Category.all
    @cities = @@cities
    @location = params[:loc]

    case @request_type 
    when 'most_popular'
      @projects = Project.sort_by_pledges(@projects)
    when 'finishing_soon'
      @projects = Project.sort_by_finishing_soon(@projects)
    end

    if @category_id && @category_id != 'all'
      @projects = @projects.select {|p| p.category_id == @category_id.to_i}
    end

    if @location && @location != 'all'
      @projects = @projects.select {|p| p.location == @location}
    end   

    respond_to do |format|
      format.html
      format.json {render :json =>  @projects }
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
    @cities = @@cities
  end

  def update
    project = Project.find(params[:id])
     project.update(project_params)
    project.end_date = project.start_date + project.days
    project.save
    redirect_to(project_path(project))
  end

  private
  def project_params
    params.require(:project).permit(:name, :description, :user_id, :target, :end_date, :location, :summary, :category_id, :search, :days, :request_type, :start_date, :project_image, :loc)
  end

end
