class Student < ApplicationRecord

  has_many :attempts
  has_many :courses, :through => :attempts
  self.primary_key = :student_id
  has_secure_password

  validates :student_id, presence: true, uniqueness: true
  validates :email, presence: true, uniqueness: true
  validates_confirmation_of :password

  @@letter_grade = {'A'=> 4, 'B+'=> 3.5, 'B'=> 3, 'C+'=> 2.5, 'C'=> 2, 'D+'=> 1.5, 'D'=> '1', 'F'=> 0}
  
  def gpax
    sum_credit = Attempt.where(student_id: self.student_id).joins(:course).sum(:credit)
    sum_product = 0
    Attempt.where(student_id: self.student_id).joins(:course).each do |a|
      sum_product += @@letter_grade[a.grade] * a.course.credit
    end
    return (sum_product/sum_credit).to_s[0..3]
  end
  
end
