require 'faker'

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

(1..10).each do |id|
  Article.create!(
    id: id,
    title: Faker::Lorem.sentence,
    image: Faker::LoremPixel.image,
    content: Faker::Lorem.paragraph(sentence_count:4, supplemental: true)
  )
end