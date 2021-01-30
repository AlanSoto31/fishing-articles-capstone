class Category < ApplicationRecord
  has_many :categorizes, dependent: :delete_all
  has_many :fishings, through: :categorizes, dependent: :delete_all

  scope :order_by_priority, -> { order(:priority) }

end
