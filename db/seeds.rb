# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'faker'
10.times
  user = User.new(
    email: 'marcos@email.com', 
    password: '123456789', 
    password_confirmation: '123456789',
    kind: 1
  )
  user.skip_confirmation!
  user.save!
end
10.times
  user = User.new(
    email: Faker::Internet.email, 
    password: '123456789', 
    password_confirmation: '123456789'
  )
  user.skip_confirmation!
  user.save!
end