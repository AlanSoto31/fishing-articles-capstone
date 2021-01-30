class Fishing < ApplicationRecord
  belongs_to :author, class_name: 'User', foreign_key: 'author_id'
  has_many :votes, dependent: :delete_all
  has_many :categorizes, dependent: :delete_all
  has_many :categories, through: :categorizes, dependent: :delete_all

  scope :order_by_votes, -> { order(votes_count: :desc) } 
  scope :ordered_by_most_recent, -> { order(created_at: :desc) }

end
