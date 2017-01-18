# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
  # Character.create(name: 'Luke', movie: movies.first) 
Product.create(name: "Dining Table", price: "$" + Faker::Number.number(4), description: "Oak Dining Table", image: "http://www.directfurnitureforu.com/ekmps/shops/terry/images/vancouver-oak-dining-table-extending-2540mm-large-22-p.jpg")
