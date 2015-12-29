class HomeController < ApplicationController

  def welcome
    @categories = Category.order(:name)
    @search = params[:search]
    @projects = Project.search(@search).select{|project| project.active? && (project.not_open_yet == false)}
    @category_id = params[:category_id]
    @location = params[:loc]

    if @category_id && @category_id != 'all'
      @projects = @projects.select {|p| p.category_id == @category_id.to_i}
    end

    if @location && @location != 'all'
      @projects = @projects.select {|p| p.location.name == @location}
    end    

    @most_popular = Project.sort_by_pledges(@projects).first(3)
    @finishing_soon = Project.sort_by_finishing_soon(@projects).first(3)
    @cities = Location.pluck(:name)
  end

  private
  def project_params
    params.require(:project).permit(:category_id, :search, :loc)
  end
end