# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
puts 'Creating users...'
until User.count == 10 do
    User.create(
        email: Faker::Internet.email,
        password: '123456',
        password_confirmation: '123456',
        name: Faker::Name.name,
        phone:Faker::PhoneNumber.phone_number,
        age: Faker::Number.between(from:18, to:65),
        role: rand(0..2)
    )
end

puts 'Creating articles...'
until Article.count == 50 do
    Article.create(
        title: Faker::Lorem.sentence(word_count: 3),
        description: Faker::Lorem.paragraph(sentence_count: 2),
        user_id: rand(1..10)
    )
end