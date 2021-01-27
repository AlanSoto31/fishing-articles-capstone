class Category < ApplicationRecord
  has_many :categorizes
  has_many :fishings, through: :categorizes
end
