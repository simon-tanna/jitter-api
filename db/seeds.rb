# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

if User.count == 0
    User.create(username: "simon1", email: "simon1@test.com", password: "password", password_confirmation: "password")
    User.create(username: "simon2", email: "simon2@test.com", password: "password", password_confirmation: "password")
    User.create(username: "simon3", email: "simon3@test.com", password: "password", password_confirmation: "password")
    User.create(username: "simon4", email: "simon4@test.com", password: "password", password_confirmation: "password")
end

if Message.count == 0
    Message.create(text: 'This is message 1', user_id: 1)
    Message.create(text: 'This is message 2', user_id: 2)
    Message.create(text: 'This is message 3', user_id: 3)
    Message.create(text: 'This is message 4', user_id: 4)
end

