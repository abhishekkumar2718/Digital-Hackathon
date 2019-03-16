# Create an election Object

elec = Election.create(position: "Position 1", deadline: DateTime.now - 1.days, election_start: DateTime.now - 3.hours, election_end: DateTime.now + 3.hours , session: "2019-20")

# Get candidate object

cd1 = Candidate.find(1)
cd2 = Candidate.find(2)

elec.add_candidate(cd1)
elec.add_candidate(cd2)

# Get voter objects

voter1 = User.find(4)
voter2 = User.find(5)

elec.add_vote(user: voter1, candidate: cd1)
elec.add_vote(user: voter2, candidate: cd2)
