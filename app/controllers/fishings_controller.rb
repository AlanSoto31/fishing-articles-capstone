class FishingsController < ApplicationController
  before_action :authenticate_user, only: %i[new create]
  before_action :check_categories, only: %i[create update]

  def index
  end

  def new
    @fishing = Fishing.new
  end

  def create
    @fishing = current_user.fishings.build(fishing_params)

    if @fishing.save
      @cat_ids_arr = fishing_params[:category_id][1..]
      @cat_ids_arr.map!(&:to_i)
      @category = Category.where(id: @cat_ids_arr)
      @fishing.categories << @category
      redirect_to root_path
    else
      render 'new'
    end
  end

  def destroy
    @fishing = Fishing.find(params[:id])
    @fishing.destroy
    redirect_to root_path
  end

  def edit
    @fishing = Fishing.find(params[:id])
  end

  def update
    @fishing = Fishing.find(params[:id])

    @cat_ids_arr = fishing_params[:category_id][1..]
    @cat_ids_arr.map!(&:to_i)
    @category = Category.where(id: @cat_ids_arr)
    @fishing.categories << @category

    @fishing.update_attributes(fishing_params)
    redirect_to root_path
  end

  def check_categories
    @fishing = Fishing.new
    return unless fishing_params[:category_id][0].blank? && fishing_params[:category_id][1].blank?

    @fishing.errors.add(:category_id, "can't be blank")
    render 'new'
  end

  private

  def fishing_params
    params.require(:fishing).permit(:author_id, :title, :text, :image, category_id: [])
  end
end