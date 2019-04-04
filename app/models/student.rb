class Student < ApplicationRecord

  has_many :attempts
  has_many :courses, :through => :attempts
  self.primary_key = :student_id
  has_secure_password

  validates :student_id, presence: true, uniqueness: true
  validates :email, presence: true, uniqueness: true
  validates_confirmation_of :password
end
