branches = [ "Computer Science And Engineering",
             "Information Technology",
             "Electrical And Comunications Engineering",
             "Electrical And Electronics Engineering",
             "Mechanical Engineering",
             "Civil Engineering",
             "Mining"
]

parties = [ "Democrats",
            "Republicans",
            "Socialists",
            "Liberals"
]

# Create a admin account

admin = User.create(username: "admin", password: "passwd", admin: true)
puts "Admin account created"


# Create candidate accounts

5.times do
  name = Faker::Name.name
  username = Faker::Internet.username
  email = Faker::Internet.email
  passwd = "passwd"
  gender = Faker::Gender.type
  branch = branches.sample
  address = Faker::Address.street_name
  year = rand(4) + 1
  affiliation = parties.sample

  cand = User.create(username: username, password: "passwd", admin: false)
  cand.user_detail.update(name: name, gender: gender, branch: branch, year: year, course: "B.Tech", email: email, hosteller: true, address: address , opt_in: true)
  cand.create_candidate(affiliation: parties.sample)
  cand.candidate.candidate_detail.update(cgpa: rand(3) + 7, about_me: "Hi! I am awesome candidate number #{cand.candidate.id}")
end

puts "Candidate accounts created"

# Create voter accounts

100.times do

  name = Faker::Name.name
  username = Faker::Internet.username
  email = Faker::Internet.email
  passwd = "passwd"
  gender = Faker::Gender.type
  branch = branches.sample
  address = Faker::Address.street_name
  year = rand(4) + 1

  voter = User.create(username: username, password: "passwd", admin: false)
  voter.user_detail.update(name: name, gender: gender, branch: branch, year: year, course: "B.Tech", email: email, hosteller: true, address: address , opt_in: true)
end

puts "Voter accounts created"
