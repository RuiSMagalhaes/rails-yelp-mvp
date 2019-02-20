# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
puts "Cleaning database..."
Restaurant.destroy_all

puts "Creating restaurants"
category = ["chinese", "italian", "japanese", "french", "belgian"]
rating = [0, 1, 2, 3, 4, 5]
10.times {
  restaurant = Restaurant.new(name: Faker::GreekPhilosophers.name , address: Faker::Address.street_address , category:category.sample, phone_number: Faker::PhoneNumber.cell_phone)
  restaurant.save
  5.times {
    review = Review.new(content: Faker::Restaurant.review, rating: rating.sample)
    review.restaurant = restaurant
    review.save
  }
}
puts "Finished!"
