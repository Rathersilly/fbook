# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
#
User.create!(name: "asdf", email: "asdf@example.com",
             password: "asdf",
             password_confirmation: "asdf")
User.create!(name: "Alice", email: "alice@example.com",
             password: "asdf",
             password_confirmation: "asdf")
User.create!(name: "Bob", email: "bob@example.com",
             password: "asdf",
             password_confirmation: "asdf")

5.times do |i|
  name = Faker::Name.first_name
  User.create!(name: name, email: "#{name}-#{i}@example.com",
               password: "asdf",
               password_confirmation: "asdf")
end

num_users = User.count
users = User.all
users.each do |user|
  2.times do 
    user.befriend users.sample
  end

end


