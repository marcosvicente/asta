# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'faker'

user = User.new(
  email: 'marcos@email.com', 
  password: '123456789', 
  password_confirmation: '123456789',
  kind: :admin
)
user.save(validate: false)

user_admin = User.new(
  email: 'admin@email.com', 
  password: '123456789', 
  password_confirmation: '123456789',
  kind: :admin
)
user_admin.save(validate: false)

user_common = User.new(
  email: 'common@email.com', 
  password: '123456789', 
  password_confirmation: '123456789',
  kind: :admin
)
user_common.save(validate: false)



5.times do
  user = User.new(
    email: Faker::Internet.email, 
    password: '123456789', 
    password_confirmation: '123456789'
  )
  user.save(validate: false)
end 

user = User.new(
  email: '@email.com', 
  password: '123456789', 
  password_confirmation: '123456789',
  kind: :commom
)
user.save(validate: false)


TypeAlgorithm.create(name: "Particional")
# TypeAlgorithm.create(name: "Hierarquicol")
