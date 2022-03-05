require "open-uri"

puts "Cleaning Database! 🧹"
Sign.destroy_all
Category.destroy_all
User.destroy_all

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
  "The Coding Class",
  "Amazing Tree"
]

all_description = [
  "This is an amazing Sign! 🐫",
  "Best Sign ever! It was very slow but I had a good laugh!",
  "Oh my god, I loved this Sign so much!",
  "Signs have always been my favorite thing. Now I finally got the chance to have one on my Birthday Party and it was amazing!"
]

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

categories = ["Food", "Love", "Garden", "Animals", "Introduction", "Traveling", "The 100 most important Signs", "Other"]

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
