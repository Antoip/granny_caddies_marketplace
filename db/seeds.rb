# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)




#lets start with cadies it is going to be funny


#caddies
#users
#bookings
#reviews
require 'faker'




puts 'Cleaning database...'
Caddie.delete_all

puts 'Cleaning database...'
User.delete_all

puts 'Cleaning database...'
Booking.delete_all

puts 'Cleaning database...'
Review.delete_all

# Users

users_attributes = []

10.times do
  users_attributes << User.create(
    email: Faker::Internet.email,
    encrypted_password: Faker::Internet.password,
    password: Faker::Internet.password
    )

end




# Caddies

 first = User.first.id
 last = User.last.id

caddies_attributes = []

myCondition = [ "New", "Bad Condition", "Perfect Condition" ]


 100.times do

 caddies_attributes << Caddie.create(
  name: Faker::Dessert.flavor,
   availability: Faker::Boolean.boolean,
    condition: myCondition.sample,
    description: Faker::Restaurant.description,
    wheels_number: rand(1..8),
    capacity: rand(5..10),
    user: User.find(rand(first..last))
    )
end

# Bookings

firstCaddie = Caddie.first.id
lastCaddie = Caddie.last.id

bookings_attributes = []

200.times do
  bookings_attributes << Booking.create(
    start_date: Faker::Date.forward(days: rand(1..30)),
    end_date: Faker::Date.backward(days: rand(31..60)),
    caddie: Caddie.find(rand(firstCaddie..lastCaddie)),
    user: User.find(rand(first..last))
    )

end


