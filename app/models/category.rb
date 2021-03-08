class Category < ApplicationRecord
  has_many :categorizes, dependent: :delete_all
  has_many :fishings, through: :categorizes, dependent: :delete_all

  validates :name, presence: true, uniqueness: true, length: { in: 3..20 }
  validates :priority, presence: true

  scope :order_by_priority, -> { order(:priority) }
end
