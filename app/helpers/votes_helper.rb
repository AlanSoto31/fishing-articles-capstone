module VotesHelper
  def make_vote(f_id)
    return if current_user.votes.find_by(fishing_id: f_id)
    @vote = link_to 'Vote', votes_path(fishing_id: f_id), method: :post, class: 'btn btn-info text-white'
  end
end