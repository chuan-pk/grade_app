# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


require 'csv'

# course_file = "./db/courses.csv"
# courses = CSV.open(course_file, headers: :first_row).map(&:to_h)
# courses.each do |course|
#   Course.create!(course)
#   puts "create course: #{course}" 
# end

# student_file = "./db/students.csv"
# students = CSV.open(student_file, headers: :first_row).map(&:to_h)
# students.each do |student|
#   Student.create!(student)
#   puts "create student: #{student}" 
# end

# students = (12345..12348)
# students.each do |student|
#   attempts_file = "./db/s#{student}_attempts.csv"
#   attempts = CSV.open(attempts_file, headers: :first_row).map(&:to_h)
#   attempts.each do |attempt|
#     Attempt.create!(attempt.merge!(student_id: "59010126#{student}"))
#     puts "#{student} attempt: #{attempt}" 
#   end
# end

require 'time'
start = Time.now
max = 100000
(1..max).each do |i|
  a = Course.create!(course_id: "a#{i}", name: "course-#{i}", credit: 3)
  if i % 100 == 0
    current = Time.now
    elapsed = Time.at((current-start).round.abs).utc.strftime "%H:%M:%S"
    puts "created: #{a.name}/#{max}     time elapsed: #{elapsed}"
  end
end