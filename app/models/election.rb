class Election < ApplicationRecord
  belongs_to :candidate, as: :winner

  has_one :vote_chain
  has_many :candidates, through: :nominations
end
