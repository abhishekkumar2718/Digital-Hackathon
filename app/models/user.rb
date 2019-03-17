class User < ApplicationRecord
  has_secure_password
  has_one :user_detail, dependent: :destroy
  has_one :candidate
  has_many :votes
  has_many :vote_chains, through: :votes

  delegate *UserDetail::ATTR_METHODS, to: :user_detail

  after_create do
    self.create_user_detail 
  end

end
