class FishingsController < ApplicationController

  before_action :authenticate_user, only: %i[new create]

  def index
    @fishings = Fishing.all
  end
  
  def new
    @fishing = Fishing.new
  end

  def create
    @fishing = current_user.fishings.build(fishing_params)

    if @fishing.save
      @algo = fishing_params[:category_id][1..]
      @algo.map!(&:to_i)
      @category = Category.where(id: @algo)
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

  private

  def fishing_params
    params.require(:fishing).permit(:author_id, :title, :text, :image, category_id: [])
  end

end
