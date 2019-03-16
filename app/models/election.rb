class Election < ApplicationRecord
  belongs_to :candidate, optional: true

  has_one :vote_chain
  has_many :candidates, through: :nominations

  after_create do 
    create_vote_chain(vote_count: nil)
    Event.create(content: "Nominations for #{postion} are open till #{deadline.strftime(%H:%M %F)}")
  end
end
