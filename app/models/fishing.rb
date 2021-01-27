class Fishing < ApplicationRecord
  belongs_to :author, class_name: 'User', foreign_key: 'author_id'
  has_many :votes

  scope :order_by_votes, -> { order(votes_count: :desc) } 

end
