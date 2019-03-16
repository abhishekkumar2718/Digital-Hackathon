class Candidate < ApplicationRecord
  belongs_to :user

  has_one :candidate_detail
  has_many :nominations
  has_many :elections, through: :nominations
  delegate *CandidateDetail::ATTR_METHODS, to: :candidate_detail

 after_initialize do
   self.build_candidate_detail if candidate_detail.nil?
 end

end
