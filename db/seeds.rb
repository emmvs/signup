require "open-uri"

puts "Cleaning Database! 🧹"
Sign.destroy_all
Category.destroy_all
User.destroy_all

puts "Database is clean! 🧼"

puts "Creating Signs... 🤟🏻🤟🏼🤟🏽🤟🏾🤟🏿"

all_title = [
  "Camel",
  "Turtle",
  "Dog",
  "Tree",
  "The Tree house is beautiful!",
  "I love Trees",
  "Coding",
  "Tree"
]

all_description = [
  "This is an amazing Sign! 🐫",
  "Best Sign ever! It was very slow but I had a good laugh!",
]

User.create!(
  username: "Emma",
  bio: "Hello, I'm Emma and this is my amazing Bio",
  email: "emma@test.com",
  password: "123456",
  language: 1,
  target_language: 1,
  # phone_number: "+90123456789",
)

categories = ["ABC", "Animals", "Food", "Garden", "Intro", "Love", "Traveling", "10 Signs", "Other"]
  User.create!(
    username: "Dustin",
    bio: "Hello, I'm Dustin and this is my amazing bio",
    email: "dustin@test.com",
    password: "123456",
    language: 1,
    target_language: 1
    # phone_number: "+90123456789",
  )

categories.each do |category|
  Category.create!(
    title: category,
    user: User.first
  )
end

2.times do
  Sign.create!(
    title: all_title.sample,
    description: all_description.sample,
    user: User.first,
    category: Category.all.sample,
    language: 1
  )
end

camel_sign = Sign.create!(
  title: all_title.sample,
  description: all_description.sample,
  user: User.first,
  category: Category.all.sample,
  language: 1
)
camel_sign.video.attach(io: File.open("db/videos/camel.mov"), filename: "camel.mov", content_type: "video/mov")
camel_sign.save!

puts "🤟🏻🤟🏼🤟🏽🤟🏾🤟🏿 Amazing! We are done 🤟🏻🤟🏼🤟🏽🤟🏾🤟🏿"
