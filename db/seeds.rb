# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

mycaddie = Caddie.new(name: "Le Caddie de Mamie",
                      condition: "Brand New",
                      wheels_number: 4,
                      capacity: "20L",
                      user: User.find(1),
                      availability: true)
mycaddie.save!

mycaddie = Caddie.new(name: "Le Caddie de Mamieee",
                      condition: "Brand New",
                      wheels_number: 4,
                      capacity: "20L",
                      user: User.find(1),
                      availability: true)
mycaddie.save!

mycaddie = Caddie.new(name: "Leeeee Caddie de Mamie",
                      condition: "Brand New",
                      wheels_number: 4,
                      capacity: "20L",
                      user: User.find(1),
                      availability: true)
mycaddie.save!
