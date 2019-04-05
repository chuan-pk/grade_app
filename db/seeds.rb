# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


require 'csv'

course_file = "./db/courses.csv"
courses = CSV.open(course_file, headers: :first_row).map(&:to_h)
courses.each do |course|
  Course.create!(course)
  puts "create course: #{course}" 
end

student_file = "./db/students.csv"
students = CSV.open(student_file, headers: :first_row).map(&:to_h)
students.each do |student|
  Student.create!(student)
  puts "create student: #{student}" 
end

s12345_attempts_file = "./db/s12345_attempts.csv"
attempts = CSV.open(s12345_attempts_file, headers: :first_row).map(&:to_h)
attempts.each do |attempt|
  Attempt.create!(attempt.merge!(student_id: 5901012612345))
  puts "attempt: #{attempt}" 
end