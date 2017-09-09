# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'

admin = User.create(username: "admin", password: "1234")
puts "Created #{admin}"

5.times do
  user = Faker::Name.unique.first_name

  User.create(username: user, password: "1234")
  puts "Created #{user}"
end

10.times do
  name = Faker::Beer.unique.name
  cost = [10, 15, 20, 25, 30, 35, 40, 45, 50].sample

  Reward.create(name: name, cost: cost)
  puts "Created #{name}"
end