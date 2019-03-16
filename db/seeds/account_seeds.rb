# Create a admin account

admin = User.create(username: "admin", password: "passwd", admin: true)
puts "Admin account created"

# Create two candidate accounts

cand1 = User.create(username: "cand1", password: "passwd", admin: false)
cand1.create_user_detail(name: "Candidate 1", gender: "male", branch: "Computer Science and Engineering", year: 1, roll_number: "181CO001", course: "B.Tech", section: "S10", email: "cand1@voting.nitk.in", hosteller: true, address: "Seventh Block", opt_in: true)

cand2 = User.create(username: "Candidate 2", password: "passwd", admin: false)
cand2.create_user_detail(name: "Candidate 2", gender: "female", branch: "Information Technology", year: 1, roll_number: "181IT002", course: "B.Tech", section: "S10", email: "cand2@voting.nitk.in", hosteller: true, address: "Girls Block 1", opt_in: true)

puts "Candidate accounts created"

# Create two voter accounts

voter1 = User.create(username: "voter1", password: "passwd", admin: false)
voter1.create_user_detail(name: "Voter 1", gender: "male", branch: "Information Technology", year: 1, roll_number: "181IT001", course: "B.Tech", section: "S10", email: "voter1@voting.nitk.in", hosteller: true, address: "First Block", opt_in: true)


voter2 = User.create(username: "voter2", password: "passwd", admin: false)
voter2.create_user_detail(name: "Voter 2", gender: "female", branch: "Computer Science And Technology", year: 1, roll_number: "181CO002", course: "B.Tech", section: "S10", email: "voter2@voting.nitk.in", hosteller: true, address: "Girls Block 1", opt_in: true)

puts "Voter accounts created"

# Create Candidate objects

cd1 = cand1.create_candidate(affiliation: "Party 1")
cd1.create_candidate_detail(cgpa: 10.0, experience: "General Secretary", about_me: "Hi! I am an awesome candidate. Vote for me.")

cd2 = cand2.create_candidate(affiliation: "Party 1")
cd2.create_candidate_detail(cgpa: 9.0, experience: "General Secretary (Girls)", about_me: "Hi! I am an awesome candidate too. Vote for me.")

puts "Candidate objects created!"
