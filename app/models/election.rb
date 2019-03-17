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

  def transactions
    file_path = Rails.root.join("public", "transactions", "#{id}.csv")
    if !File.exists? file_path
      attributes = %w{id data created_at updated_at prev_hash}
      CSV.open(file_path, "w",
              write_headers: true,
              headers: attributes) do |csv|

        vote_chain.votes.each do |vote|
          csv << attributes.map{ |attr| vote.send(attr) }
        end
      end
    end
    return file_path
  end

  def demographics
    file_path = Rails.root.join("public", "demographics", "#{id}.csv")
    if !File.exists? file_path
      attributes = %{voted_for gender branch year address}
      CSV.open(file_path, "w",
               write_headers: true,
               headers: attributes) do |csv|
        vote_chain.votes.each do |vote|
          voter = vote.voter
          row = [vote.data, voter.gender, voter.branch, voter.year, voter.address]
          csv << row
        end
      end
    end
    return file_path
  end

  def candidates_csv
    file_path = Rails.root.join("public", "candidates", "#{id}.csv")
    if !File.exists? file_path
      attributes = %{id name}
      CSV.open(file_path, "w",
               write_headers: true,
               headers: attributes) do |csv|
        candidates.each do |candidate|
          row = [candidate.id, candidate.user.name]
          csv << row
        end
       end
    end
    return file_path
  end
end
