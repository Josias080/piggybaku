# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

test_user_data = [
  {
    username: 'Tomomi',
    email: 'Tomomi@lewagon.com',
    password: 'password',
  }
]

test_feelings_data = [

  {
    content: "I can't understand what's going on in class.",
    price_cents: 500,
    is_positive: false,
    is_buried: true,
    flowers: 4,
  },
  {
    content: "Just really tired",
    price_cents: 800,
    is_positive: false,
    is_donated: true,
    is_buried: true,
    flowers: 11,
  },
  {
    content: "I’m a fake and I’m going to be found out.",
    price_cents: 800,
    is_positive: false,
    is_buried: true,
    flowers: 20,
  },
  {
    content: "I managed to find a mistake that would have crashed the program.",
    price_cents: 1000,
    is_positive: true,
    is_buried: true,
    flowers: 4,
  },
  {
    content: "I finished the feature branch on my own today.",
    price_cents: 800,
    is_positive: true,
    is_donated: true,
    is_buried: true,
    flowers: 8,
  },
  {
    content: "Answered a question on stackoverflow and got upvoted.",
    price_cents: 400,
    is_positive: true,
    is_donated: true,
    is_buried: true,
    flowers: 30,
  },
  {
    content: "Got stuck on fizzbuzz whut.",
    price_cents: 300,
    is_positive: false,
    is_buried: true,
    flowers: 14,
  },
  {
    content: "I’m useless and people will know",
    price_cents: 900,
    is_positive: false,
    is_buried: true,
    flowers: 25,
  },
  {
    content: "Today my boss handed my project to Edward. Am I not good enough?",
    price_cents: 1000,
    is_positive: false,
    is_buried: true,
    flowers: 0,
  },
  {
    content: "My colleagues ignored what I suggested again.",
    price_cents: 500,
    is_positive: false,
    is_buried: true,
    flowers: 9,
  },
  {
    content: "Work is really boring, I'm just doing the same thing over and over again.",
    price_cents: 300,
    is_positive: false,
    is_buried: true,
    flowers: 11,
  },
  {
    content: "Manager hinted that I might be getting promoted soon!",
    price_cents: 900,
    is_positive: true,
    is_buried: true,
    flowers: 22,
  },
  {
    content: "My friends threw me a surprise birthday party!",
    price_cents: 800,
    is_positive: true,
    is_donated: true,
    is_buried: true,
    flowers: 14,
  },
  {
    content: "Attended a really nice talk at LeWagon today, feeling inspired!",
    price_cents: 700,
    is_positive: true,
    is_donated: true,
    is_buried: true,
    flowers: 31,
  },
  {
    content: "Why am I always so careless with syntax",
    price_cents: 200,
    is_positive: false,
    is_buried: true,
    flowers: 5,
  },
  {
    content: "It feels like there are so many things to learn",
    price_cents: 300,
    is_positive: false,
    is_buried: true,
    flowers: 9,
  }
]

Feeling.destroy_all
User.destroy_all


test_user_data.each do |user|
  User.create!(user)
end

test_feelings_data.each do |feeling|
  new_feeling = Feeling.new(feeling)
  new_feeling.user = User.all.sample
  new_feeling.created_at = (rand(1..4)).days.ago
  new_feeling.save
end
