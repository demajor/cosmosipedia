require 'faker'

# Create users
5.times do
  User.create!(
    email: Faker::Internet.email,
    password: "password",
    password_confirmation: "password"
    # role: "standard"
  )
end
users = User.all

# Create wikis
25.times do
  Wiki.create!(
    user: users.sample,
    title: Faker::Book.title,
    body: Faker::Lorem.paragraph,
    private: false
  )
end

puts "Seed finished"
puts "#{User.count} users created"
puts "#{Wiki.count} wikis created"
