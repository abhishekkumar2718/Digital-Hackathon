class Nomination < ApplicationRecord
  belongs_to :candidate
  belongs_to :election

  after_create do
    Event.create(content: "#{candidate.user.name} has been nominated for #{election.position} #{election.session}")
  end
end
