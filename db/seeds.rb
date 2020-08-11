require 'faker'

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

(1..20).each do |i|
  Message.create!(
    id: i,
    name: Faker::Name.name,
    email: Faker::Internet.email,
    message: Faker::Lorem.paragraphs(number: 2)
  )
end

(1..20).each do |j|
  Article.create!(
    id: j,
    title: Faker::Quote.most_interesting_man_in_the_world,
    image: Faker::LoremPixel.image,
    content: Faker::Lorem.paragraph(sentence_count: 50, supplemental: true),
  )
end

User.create(
  email: 'demo@securerailstheme.com',
  password: '12345Demo!@#$%',
  password_confirmation: '12345Demo!@#$%',
  admin: true
)