class VotesController < ApplicationController
  def new
    @vote = Vote.new
  end

  def create
    @category = Category.find_by_id(params[:id])
    @vote = current_user.votes.build(fishing_id: params[:fishing_id])
    @vote.save
    redirect_to @category

  end

  def destroy
    @vote = current_user.votes.find_by(fishing_id: params[:fishing_id])
    @vote.destroy
    redirect_to category_path
  end
  
end
