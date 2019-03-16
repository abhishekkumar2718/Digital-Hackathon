class VoteChain < ApplicationRecord
  belongs_to :election
  serialize :vote_count, Hash
  has_many :votes

  after_create do 
    votes.create(data: -1)
  end

  def add_vote(voter, candidate)
    votes.create(data: candidate.id, user: voter, prev_hash: votes.last.hash)
    Event.create(content: "A vote #{votes.last.hash} has been cast in elections for #{election.position} #{election.session}")
  end

  def add_candidate(candidate)
    vote_count[candidate] = 0
    update
  end
end
