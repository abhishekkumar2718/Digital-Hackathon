class UserDetail < ApplicationRecord
  belongs_to :user

  ATTR_METHODS = [:email, :email=,:gender, :gender=,:branch, :branch=,:course, :course=,:year, :year=,:section, :section=,:block, :block=,:name,:name=, :roll_number, :roll_number=, :address, :address=]

end
