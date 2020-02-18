# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'faker'
require "open-uri"

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

5.times do
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

my_condition = [ "New", "Bad Condition", "Perfect Condition" ]


# 5.times do
#   caddie = Caddie.new(
#     name: Faker::Dessert.flavor,
#     availability: Faker::Boolean.boolean,
#     condition: my_condition.sample,
#     description: Faker::Restaurant.description,
#     wheels_number: rand(1..7),
#     capacity: rand(5..10),
#     user: User.find(rand(first..last)),
#     price: rand(1..100)
#   )
#   arrayPhoto = ['https://www.cdiscount.com/pdt2/8/3/6/1/700x700/tec4260397657836/rw/caddie-de-courses-chariot-de-courses-chariot-de.jpg',
#                 'https://medias.pylones.com/10371-thickbox_default/caddie-de-courses-trolly.jpg',
#                 'https://www.cdiscount.com/pdt2/0/6/9/1/700x700/son6955880358069/rw/songmics-chariot-de-courses-caddie-de-courses-pli.jpg',
#                 'https://www.facilavi.com/3183-large_default/caddie-de-courses-go-fun.jpg',
#                 'https://www.cdiscount.com/pdt2/6/9/6/1/1200x1200/wed3701095707696/rw/chariot-de-course-poussette-de-marche-isotherme-6.jpg',
#                 'https://awaxland.com/wp-content/uploads/2016/12/IMG_3601.jpg',
#                 'https://www.sedao.com/891467-12950/chariot-de-courses.jpg',
#                 'https://cdn.poussette-marche.com/media/catalog/product/cache/f82b03fea05b2a54a701e1b60cda44d8/c/h/chariot-courses-andersen-hydro-vert-caddie.jpg',
#                 'https://images-na.ssl-images-amazon.com/images/I/51nnUxgDrjL._AC_SY450_.jpg',
#                 'https://www.cote-eden.com/pub/Courses/chariot_course_1206_1.jpg',
#                 'https://www.cdiscount.com/pdt2/8/0/9/1/700x700/cad3607070930809/rw/caddie-poussette-de-marche-vanero-6-roues-pied-abs.jpg',
#                 'https://www.site-annonce.fr/sh-img/71nQOdpxpgL._SY355_.jpg',
#                 'https://static.fnac-static.com/multimedia/Images/FR/MC/52/eb/68/23653202/1540-1/tsp20140930004735/Chariot-de-courses-Caddie-Fun-Jaune.jpg',
#                 'https://m.media-amazon.com/images/I/41ES2VFyIOL.jpg',
#                 'https://medicaldomicile.fr/5420-home_default/chariot-caddie-courses-shop-n-sit.jpg',
#                 'https://i.ebayimg.com/images/g/VAsAAOSwyApcTCLM/s-l300.jpg',
#                 'https://i.ebayimg.com/images/g/Bu8AAOSwjfpcJkNE/s-l300.jpg',
#                 'https://top-sacs-et-cabas.fr/wp-content/uploads/2018/09/mymotto-32l-chariot-de-course-6-roues-2-en-1-caddie-courses-pliable-roulette-impermable-panier-de-march-de-la-marque-mymotto-image-0-6.jpg',
#                 'https://rivieramagazine.fr/wp-content/uploads/2015/01/IMG_4258.jpg',
#                 'https://static.fnac-static.com/multimedia/Images/31/33/34/34/4431944-1505-1540-1/tsp20170731145944/Chariot-De-Courses-A-Roulettes-Cabas-Shopping-Design-Ludique-Legumes-Tetris-Argente.jpg',
#                 'https://www.luckyfind.fr/sites/luckyfind/files/classifieds/055824-5bab5c8f81ee0-5bab5c2abf01c-100_7775.jpg',
#                 'https://www.panierbiorennes.fr/image/cache/data/category_58/20180516034705302896445-500x500-product_popup.jpg',
#                 'https://www.paris-prix.com/5314-large_paris/chariot-de-courses-monsieur-madame-blanc.jpg',
#                 'https://www.e-medical-shopping.com/20068-thickbox_default/chariot-de-courses-rollator-carlett-lett-900.jpg']
#   file = URI.open(arrayPhoto.sample)
#  # array.delete(sample)
#   caddie.photo.attach(io: file, filename: "#{file.scan(/.{10}$/)}",content_type: 'image/jpg')
#   caddie.save!
# end


caddie = Caddie.create(
  name:          "Chariot mémé",
  availability:  Faker::Boolean.boolean,
  condition:     my_condition.sample,
  description:   "wonderful red trolley with leather handle never used",
  wheels_number: 2,
  capacity:      rand(5..10),
  user:          User.find(rand(first..last)),
  price:         rand(1..100)
)

file = URI.open('https://www.cdiscount.com/pdt2/8/3/6/1/700x700/tec4260397657836/rw/caddie-de-courses-chariot-de-courses-chariot-de.jpg')
caddie.photo.attach(io: file, filename: 'chariot.jpg', content_type: 'image/png')





caddie1 = Caddie.create(
  name:          "Trolly",
  availability:  Faker::Boolean.boolean,
  condition:     my_condition.sample,
  description:   "flower pattern trolley with metal frame",
  wheels_number: 2,
  capacity:      rand(5..10),
  user:          User.find(rand(first..last)),
  price:         rand(1..100)
)

file = URI.open('https://medias.pylones.com/10371-thickbox_default/caddie-de-courses-trolly.jpg')
caddie1.photo.attach(io: file, filename: 'trolly.jpg', content_type: 'image/png')






caddie2 = Caddie.create(
  name:          "Classy caddie",
  availability:  Faker::Boolean.boolean,
  condition:     my_condition.sample,
  description:   "Great grey caddie with metallic frame",
  wheels_number: 2,
  capacity:      rand(5..10),
  user:          User.find(rand(first..last)),
  price:         rand(1..100)
)

file = URI.open('https://www.cdiscount.com/pdt2/0/6/9/1/700x700/son6955880358069/rw/songmics-chariot-de-courses-caddie-de-courses-pli.jpg')
caddie2.photo.attach(io: file, filename: 'classy_caddie.jpg', content_type: 'image/png')



caddie3 = Caddie.create(
  name:          "Reddy MacRed",
  availability:  Faker::Boolean.boolean,
  condition:     my_condition.sample,
  description:   "new design trolley with increased capacity",
  wheels_number: 2,
  capacity:      rand(5..10),
  user:          User.find(rand(first..last)),
  price:         rand(1..100)
)

file = URI.open('https://www.facilavi.com/3183-large_default/caddie-de-courses-go-fun.jpg')
caddie3.photo.attach(io: file, filename: 'red.jpg', content_type: 'image/png')



caddie4 = Caddie.create(
  name:          "Floflo",
  availability:  Faker::Boolean.boolean,
  condition:     my_condition.sample,
  description:   "3years old flower pattern trolley really good for stairs",
  wheels_number: 6,
  capacity:      rand(5..10),
  user:          User.find(rand(first..last)),
  price:         rand(1..100)
)

file = URI.open('https://www.cdiscount.com/pdt2/6/9/6/1/1200x1200/wed3701095707696/rw/chariot-de-course-poussette-de-marche-isotherme-6.jpg')
caddie4.photo.attach(io: file, filename: 'floflo.jpg', content_type: 'image/png')




caddie5 = Caddie.create(
  name:          "Techno caddie",
  availability:  Faker::Boolean.boolean,
  condition:     my_condition.sample,
  description:   "techno pattern kart for youngsters",
  wheels_number: 2,
  capacity:      rand(5..10),
  user:          User.find(rand(first..last)),
  price:         rand(1..100)
)

file = URI.open('https://awaxland.com/wp-content/uploads/2016/12/IMG_3601.jpg')
caddie5.photo.attach(io: file, filename: 'techno.jpg', content_type: 'image/png')



caddie6 = Caddie.create(
  name:          "Dalmatians",
  availability:  Faker::Boolean.boolean,
  condition:     my_condition.sample,
  description:   "High Capacity trolley brand new with extra pockets dalmatians patterns",
  wheels_number: 6,
  capacity:      rand(5..10),
  user:          User.find(rand(first..last)),
  price:         rand(1..100)
)

file = URI.open('https://www.sedao.com/891467-12950/chariot-de-courses.jpg')
caddie6.photo.attach(io: file, filename: 'dalmatians.jpg', content_type: 'image/png')



caddie7 = Caddie.create(
  name:          "Summer Picnic",
  availability:  Faker::Boolean.boolean,
  condition:     my_condition.sample,
  description:   "6 wheels summer trolley with a chair in addition",
  wheels_number: 6,
  capacity:      rand(5..10),
  user:          User.find(rand(first..last)),
  price:         rand(1..100)
)

file = URI.open('https://www.cote-eden.com/pub/Courses/chariot_course_1206_1.jpg')
caddie7.photo.attach(io: file, filename: 'summer.jpg', content_type: 'image/png')



caddie8 = Caddie.create(
  name:          "Freezer black",
  availability:  Faker::Boolean.boolean,
  condition:     my_condition.sample,
  description:   "black trolley ideal to keep food cold",
  wheels_number: 2,
  capacity:      rand(5..10),
  user:          User.find(rand(first..last)),
  price:         rand(1..100)
)

file = URI.open('https://m.media-amazon.com/images/I/41ES2VFyIOL.jpg')
caddie8.photo.attach(io: file, filename: 'freezer.jpg', content_type: 'image/png')



caddie9 = Caddie.create(
  name:          "80's caddies",
  availability:  Faker::Boolean.boolean,
  condition:     my_condition.sample,
  description:   "red and white caddie old fashioned used only few times",
  wheels_number: 2,
  capacity:      rand(5..10),
  user:          User.find(rand(first..last)),
  price:         rand(1..100)
)

file = URI.open('https://www.luckyfind.fr/sites/luckyfind/files/classifieds/055824-5bab5c8f81ee0-5bab5c2abf01c-100_7775.jpg')
caddie9.photo.attach(io: file, filename: 'old.jpg', content_type: 'image/png')



 Bookings

 firstCaddie = Caddie.first.id
 lastCaddie = Caddie.last.id

 bookings_attributes = []

 20.times do
   bookings_attributes << Booking.create(
     start_date: Faker::Date.forward(days: rand(1..30)),
     end_date: Faker::Date.backward(days: rand(31..60)),
     caddie: Caddie.first,
     user: User.find(rand(first..last))
     )

 end

 #Reviews

 firstBooking = Booking.first.id
 lastBooking = Booking.last.id

 reviews_attributes = []


   reviews_attributes << Review.create(
     description: "really bad experience, wheel was broken",
     rating: 1,
     booking: Booking.find(rand(firstBooking..lastBooking))
     )




   reviews_attributes << Review.create(
     description: "perfect, nothing to add",
     rating: 5,
     booking: Booking.find(rand(firstBooking..lastBooking))
     )



   reviews_attributes << Review.create(
     description: "Helping me a lot carry my groceries",
     rating: 4,
     booking: Booking.find(rand(firstBooking..lastBooking))
     )



   reviews_attributes << Review.create(
     description: "it was ok",
     rating: 3,
     booking: Booking.find(rand(firstBooking..lastBooking))
     )



   reviews_attributes << Review.create(
     description: "would definitely recommend to a granny",
     rating: 5,
     booking: Booking.find(rand(firstBooking..lastBooking))
     )



   reviews_attributes << Review.create(
     description: "too expensive",
     rating: 3,
     booking: Booking.find(rand(firstBooking..lastBooking))
     )



   reviews_attributes << Review.create(
     description: "not my style but definitely worthit",
     rating: 4,
     booking: Booking.find(rand(firstBooking..lastBooking))
     )




   reviews_attributes << Review.create(
     description: "a little too heavy for an oldy like me",
     rating: 3,
     booking: Booking.find(rand(firstBooking..lastBooking))
     )




   reviews_attributes << Review.create(
     description: "...",
     rating: 3,
     booking: Booking.find(rand(firstBooking..lastBooking))
     )




   reviews_attributes << Review.create(
     description: "fabulous love it",
     rating: 5,
     booking: Booking.find(rand(firstBooking..lastBooking))
     )




   reviews_attributes << Review.create(
     description: "handle doesn't have a good grip",
     rating: 3,
     booking: Booking.find(rand(firstBooking..lastBooking))
     )




   reviews_attributes << Review.create(
     description: "nice concept and trolley",
     rating: 4,
     booking: Booking.find(rand(firstBooking..lastBooking))
     )



   reviews_attributes << Review.create(
     description: "want to buy one now",
     rating: 5,
     booking: Booking.find(rand(firstBooking..lastBooking))
     )






#photos cloudinary


