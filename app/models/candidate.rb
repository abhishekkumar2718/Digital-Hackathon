class Candidate < ApplicationRecord
  belongs_to :user

  has_one :candidate_detail
  has_many :elections, through: :nominations
end
