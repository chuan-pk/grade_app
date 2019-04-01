class Student < ApplicationRecord
  has_secure_password

  validates :student_id, presence: true, uniqueness: true
  validates :email, presence: true, uniqueness: true
end
