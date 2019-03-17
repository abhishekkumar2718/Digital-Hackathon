# Create Elections

elec1 = Election.create(position: "Position 1", deadline: DateTime.now - 1.days, election_start: DateTime.now - 3.hours, election_end: DateTime.now + 3.hours , session: "2019-20")
elec2 = Election.create(position: "Position 2", deadline: DateTime.now - 1.week, election_start: DateTime.now - 6.days, election_end: DateTime.now - 5.days, session: "2019-20")
elec3 = Election.create(position: "Position 2", deadline: DateTime.now + 1.day, election_start: DateTime.now + 2.days, election_end: DateTime.now + 3.days, session: "2019-20")

puts "Elections added"

# Adding candidations to elections


5.times do |num|
  elec1.add_candidate(Candidate.find(num+1))
end

2.times do
  elec2.add_candidate(Candidate.find(Candidate.pluck(:id).sample))
end

elec3.add_candidate(Candidate.last)

puts "Candidates added"

# Get voter objects

100.times do |num|
  candidate_ids = elec2.candidates.pluck(:id)
  elec2.add_vote(User.find(num + 7), Candidate.find(candidate_ids.sample))
end

50.times do |num|
  candidate_ids = elec1.candidates.pluck(:id)
  elec3.add_vote(User.find(num + 7), Candidate.find(candidate_ids.sample))
end

puts "Votes added"
