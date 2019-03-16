class User::UserDetail < ApplicationRecord
  belongs_to :user_user, class_name: "User", foreign_key: "user_user_id"
end
