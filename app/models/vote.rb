class Vote < ApplicationRecord
  belongs_to :userid
  belongs_to :fishingid
end
