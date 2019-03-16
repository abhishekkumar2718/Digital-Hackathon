class CandidateDetail < ApplicationRecord
  belongs_to :candidate
    ATTR_METHODS = [:cgpa, :cgpa=,:experience, :experience=,:manifesto, :manifesto=,:about_me,:about_me=]
end
