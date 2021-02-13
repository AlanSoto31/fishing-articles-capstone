# rubocop:disable Layout/LineLength
class CategoriesController < ApplicationController
  def index
    @more_important_categories = Category.all.order_by_priority
    @favorite_fishings = Fishing.all.order_by_votes.first
  end

  def show
    @category = Category.find(params[:id])
    @fishings_by_category = Fishing.includes(:author).includes(:categories).where(categories: { id: params[:id] }).order(created_at: :desc)
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

# rubocop:enable Layout/LineLength