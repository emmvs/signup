# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require "open-uri"

puts "Cleaning Database! 🧹"

Category.destroy_all
User.destroy_all
Sign.destroy_all

puts "Database is clean! 🧼"

puts "Creating Signs... 🤟🏻🤟🏼🤟🏽🤟🏾🤟🏿"

all_title = [
  "The House",
  "The Camel",
  "The Turtle",
  "The Dog",
  "The Tree",
  "The Tree house is beautiful!",
  "I love Trees",
  "The Coding Class"
]

all_description = [
  "This is an amazing Sign! 🐫",
  "Best Sign ever! It was very slow but I had a good laugh!",
  "Oh my god, I loved this Sign so much!",
  "Signs have always been my favorite thing. Now I finally got the chance to have one on my Birthday Party and it was amazing!"
]

e = 0

  User.create!(
    username: Faker::FunnyName.name,
    bio: "Hello, I'm Emma and this is my amazing bio",
    email: "emma@test.com",
    password: "123456",
    language: 1,
    target_language: 1,
    # phone_number: "+90123456789",
  )

  User.create!(
    username: Faker::FunnyName.name,
    bio: "Hello, I'm Dustin and this is my amazing bio",
    email: "dustin@test.com",
    password: "123456",
    language: 1,
    target_language: 1,
    # phone_number: "+90123456789",
  )

  Category.create!(
    title: ["Food", "Love", "Garden", "Animals", "Inroduction", "Traveling", "The 100 most important Signs", "Other"].sample,
    user: User.first
  )

10.times do
  sign = Sign.create!(
    title: all_title.sample,
    description: all_description.sample,
    user: User.first,
    category: Category.first,
    language: 1
  )
  # sign = URI.open('https://source.unsplash.com/collection/9894242')
  # Sign.photo.attach(io: photo, filename: "Sign#{e}.png", content_type: 'image/png')
  # Sign.save!
  # puts "Sign #{Sign.id} is created 🤟"
  # e = e + 1
end

puts "🤟🏻🤟🏼🤟🏽🤟🏾🤟🏿 Amazing! We are done 🤟🏻🤟🏼🤟🏽🤟🏾🤟🏿"



# List
# Title

# Category
# Title
