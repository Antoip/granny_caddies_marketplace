# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'faker'

puts 'Cleaning database...'
Review.delete_all

puts 'Cleaning database...'
Booking.delete_all

puts 'Cleaning database...'
Caddie.delete_all

puts 'Cleaning database...'
User.delete_all




# Users

users_attributes = []

50.times do
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


 200.times do

 caddies_attributes << Caddie.create(
  name: Faker::Dessert.flavor,
   availability: Faker::Boolean.boolean,
    condition: myCondition.sample,
    description: Faker::Restaurant.description,
    wheels_number: rand(1..8),
    capacity: rand(5..10),
    user: User.find(rand(first..last)),
    price: rand(1..100)
    )
end



# Bookings

firstCaddie = Caddie.first.id
lastCaddie = Caddie.last.id

bookings_attributes = []

400.times do
  bookings_attributes << Booking.create(
    start_date: Faker::Date.forward(days: rand(1..30)),
    end_date: Faker::Date.backward(days: rand(31..60)),
    caddie: Caddie.find(rand(firstCaddie..lastCaddie)),
    user: User.find(rand(first..last))
    )

end

#Reviews

firstBooking = Booking.first.id
lastBooking = Booking.last.id

reviews_attributes = []

500.times do
  reviews_attributes << Review.create(
    description: Faker::Restaurant.description,
    rating: rand(1..5),
    booking: Booking.find(rand(firstBooking..lastBooking))
    )

end


