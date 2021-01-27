class Vote < ApplicationRecord
  belongs_to :user
  belongs_to :fishing, counter_cache: true
end
