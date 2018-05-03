# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Product.create(price: 800, name: "snap_up")
Product.create(price: 900, name: "snap_down")
Product.create(price: 1000, name: "snap_both")


Product.create(price: 600, name: "clear_up")
Product.create(price: 700, name: "clear_down")
Product.create(price: 800, name: "clear_both")


Style.create(name: "hollywood", tagline: "(The typical Hollywood smile)")
Style.create(name: "natural", tagline: "(Natural healthy shape)")
Style.create(name: "sharp", tagline: "(Edgy attractive looks)")
Style.create(name: "soft", tagline: "(Smooth detailed edges)")

Style.create(name: "clearup", tagline: "") 