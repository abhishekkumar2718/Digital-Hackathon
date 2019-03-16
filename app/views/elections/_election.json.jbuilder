json.extract! election, :id, :position, :deadline, :date_of_election, :session, :candidate_id, :created_at, :updated_at
json.url election_url(election, format: :json)
