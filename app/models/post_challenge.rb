class PostChallenge < ApplicationRecord
  belongs_to :post
  belongs_to :challenge
end
