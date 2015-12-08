class HomeController < ApplicationController

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

  def welcome
    @categories = Category.order(:name)
    @projects = Project.search(params[:search])
    @search = params[:search]
    @category_id = params[:category_id]
    @location = params[:loc]

    if @category_id && @category_id != 'all'
      @projects = @projects.select {|p| p.category_id == @category_id.to_i}
    end

    if @location && @location != 'all'
      @projects = @projects.select {|p| p.location == @location}
    end    

    @most_popular = Project.sort_by_pledges(@projects).first(3)
    @finishing_soon = Project.sort_by_finishing_soon(@projects).first(3)
    @cities = @@cities
  end

  private
  def project_params
    params.require(:project).permit(:category_id, :search, :loc)
  end
end