class CategoriesController < ApplicationController
  before_action :set_category, only: [:show, :edit, :update, :destroy]
 
  def index
    @categories = Category.all
  end

  private

  def category_params
    params.require(:category).permit(:name)
  end

  def set_category
    @category = Category.find(params[:id])
  end
end
