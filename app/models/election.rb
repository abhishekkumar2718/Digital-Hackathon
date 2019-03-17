class Election < ApplicationRecord
  belongs_to :candidate, optional: true

  has_one :vote_chain
  has_many :nominations
  has_many :candidates, through: :nominations

  after_create do
    create_vote_chain
    Event.create(content: "#{position} #{session} has been announced!")
  end

  def add_vote(user, candidate)
    vote_chain.add_vote(user, candidate)
  end

  def add_candidate(candidate)
    Nomination.create(election: self, candidate: candidate)
  end

  def in_progress?
    Time.now.between?(election_start, election_end)
  end
end
