# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
puts "about to destroy the database"
User.destroy_all
puts "database destroyed"

User.create(email: "felipe@felipesuero.com" , password: "password", admin: true)
puts "created felipe@felipesuero.com with a password of password"
30.times do 
	User.create(email:Faker::Internet.unique.email , password: "password", admin: [true, false, false, false].sample)
end
puts "Finished creating 30 new users"