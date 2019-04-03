# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


require 'csv'

file = "./db/courses.csv"

courses = CSV.open(file, headers: :first_row).map(&:to_h)

courses.each do |course|
  Course.create!(course)
  puts "create course: #{course}" 
end