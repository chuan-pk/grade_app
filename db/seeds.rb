# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

courses = [
  {course_id: "010123120", name: "EMBEDDED SYSTEM DESIGN LABOR", credit: 1},
  {course_id: "010123121", name: "DATABASE SYSTEMS", credit: 3},
  {course_id: "010123128", name: "COMPUTER NETWORKS LABORATORY", credit: 1},
  {course_id: "010123211", name: "SIMULATION AND MODELING", credit: 3},
  {course_id: "010123213", name: "ARTIFICIAL INTELLIGENCE", credit: 3},
  {course_id: "01012610091", name: "MY DUMMY COURSE", credit: 3, detail: "This is DUMMY COURSE's Details"},
]

courses.each do |course|
  Course.create!(course)
end