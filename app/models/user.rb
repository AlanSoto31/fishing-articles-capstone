class User < ApplicationRecord
  validates :name, presence: true, uniqueness: true, length: { in: 3..15}

  has_many :fishings, foreign_key: :user_id
end
