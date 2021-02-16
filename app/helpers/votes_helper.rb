module VotesHelper
  def vote_unvote(f_id, c_id)
    return unless user_sign_in?

    if current_user.votes.find_by(fishing_id: f_id)
      link_to 'Unvote', vote_path(fishing_id: f_id), method: :delete, class: 'text-decoration-none fw-bold'
    else
      link_to 'Vote', votes_path(fishing_id: f_id, id: c_id), method: :post, class: 'text-decoration-none fw-bold'
    end
  end
end
