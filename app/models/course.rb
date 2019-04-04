class Course < ActiveRecord::Base

  has_many :attempts
  has_many :student, :through => :attempts 

  self.primary_key = :course_id
  before_save :uppercase_course_name

  def uppercase_course_name
    self.name.upcase!
  end

  def self.all_credits
    [1, 2, 3]
  end

  validates(:course_id, presence: true, uniqueness: true)
  validates(:name, presence: true)
  validates(:credit, :inclusion => {:in => self.all_credits})
end