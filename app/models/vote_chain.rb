class VoteChain < ApplicationRecord
  belongs_to :election

  has_many :votes
end
