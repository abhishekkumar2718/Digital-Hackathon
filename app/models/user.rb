class User < ApplicationRecord
  has_secure_password
  has_one :user_detail, dependent: :destroy
  has_one :candidate
  has_many :votes
  delegate :email, to: :user_detail

  after_initialize do
    self.build_user_detail if user_detail.nil?
  end
end