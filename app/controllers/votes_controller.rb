class VotesController < ApplicationController

  def new
    @vote = Vote.new
  end

  def create
    @vote = current_user.votes.build(vote_params)
    if @vote.save
      redirect_to root_path
    else
      render 'new'
    end
  end

  private

  def vote_params
    params.permit(:fishing_id)
  end
end
