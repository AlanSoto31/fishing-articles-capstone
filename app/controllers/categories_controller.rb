class CategoriesController < ApplicationController

  def index
    @categories = Category.all
    @favorite_fishings = Fishing.all.order_by_votes.first
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.new(category_params)
    if @category.save
      redirect_to root_path
    else
      render 'new'
    end
  end

  private

  def category_params
    params.require(:category).permit(:name, :priority)
  end
end
