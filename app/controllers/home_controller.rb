class HomeController < ApplicationController

  def welcome
    @most_popular = Project.pledges_count.first(3)
    @finishing_soon = Project.finishing_soon.first(3)
  end


end