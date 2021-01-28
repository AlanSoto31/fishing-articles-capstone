class Category < ApplicationRecord
  has_many :categorizes
  has_many :fishings, through: :categorizes

  scope :order_by_priority, -> { order(:priority) }
end
