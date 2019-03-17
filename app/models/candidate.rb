class Candidate < ApplicationRecord
  belongs_to :user

  has_one :candidate_detail
  has_many :nominations
  has_many :elections, through: :nominations


  delegate *CandidateDetail::ATTR_METHODS, to: :candidate_detail

 after_create do
   self.create_candidate_detail
 end

end
