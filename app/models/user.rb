class User < ApplicationRecord
  has_secure_password

  has_one :user_detail
  has_one :candidate
  has_many :votes
end
