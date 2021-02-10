module VotesHelper
  def make_vote(f_id)
    @vote = nil
    return unless user_sign_in?
    return if current_user.votes.find_by(fishing_id: f_id)

    @vote = link_to 'Vote', votes_path(fishing_id: f_id), method: :post, class: 'text-decoration-none fw-bold'
  end
end
