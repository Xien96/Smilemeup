# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or create!d alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create!([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create!(name: 'Luke', movie: movies.first)

Product.create!( name: "snap_up")
Product.create!( name: "snap_down")
Product.create!( name: "snap_both")


Product.create!( name: "clear_up")
Product.create!( name: "clear_down")
Product.create!( name: "clear_both")


Style.create!(name: "hollywood", tagline: "(The typical Hollywood smile)")
Style.create!(name: "natural", tagline: "(Natural healthy shape)")
Style.create!(name: "sharp", tagline: "(Edgy attractive looks)")
Style.create!(name: "soft", tagline: "(Smooth detailed edges)")

Style.create!(name: "clearup", tagline: "")