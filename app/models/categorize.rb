class Categorize < ApplicationRecord
  belongs_to :category
  belongs_to :fishing
  validates :category_id, presence: true
  validates :fishing_id, presence: true
end
