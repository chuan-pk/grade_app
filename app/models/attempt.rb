class Attempt < ApplicationRecord
  belongs_to :course
  belongs_to :student

  validates :course_id, :presence => true
  validates_associated :course
  validate :not_passed
  validate :difference_semester

  def not_passed
    Attempt.where(student_id: student_id, course_id: course_id).each do |a|
      errors.add(:course_id, "You passed #{course_id}: #{course.name}") if a.grade != "F"  
    end
  end

  def difference_semester
      errors.add(:course_id, "You attempted #{course_id}: #{course.name} in this semester (#{semester}/#{year})") if
        Attempt.where(student_id: student_id, course_id: course_id, year: year, semester: semester).exists?
  end

end
