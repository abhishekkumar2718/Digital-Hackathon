class User::User < ApplicationRecord
  has_secure_password
  
  validates :username, presence: true, uniqueness: true

  has_one :user_user_detail, class_name: "UserDetail", foreign_key: "user_user_id"
end
