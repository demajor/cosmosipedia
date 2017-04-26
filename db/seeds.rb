
require 'faker'

# Create users
5.times do
  User.create!(
    email: Faker::Internet.email,
    password: "password",
    password_confirmation: "password",
    confirmed_at: Time.now
  )
end
users = User.all

# Create wikis
15.times do
  Wiki.create!(
    user: users.sample,
    title: Faker::Music.instrument,
    body: Faker::Hipster.paragraph,
    private: false
  )
end

puts "Seed finished"
puts "#{User.count} users created"
puts "#{Wiki.count} items created"


# require 'faker'

# User.destroy_all

# # Create users
# 5.times do
#   user = User.new(
#     # name: Faker::Name.name,      
#     email: Faker::Internet.email,
#     password: 'password'
#     )
#   user.skip_confirmation!
#   user.save!
# end

# admin = User.new(
#   # name:       'Admin',
#   email:      'admin@example.com',
#   password:   'password',
#   role:       'admin'
#   )
# admin.skip_confirmation!
# admin.save!

# premium = User.new(
#   # name:       'Premium',
#   email:      'premium@example.com',
#   password:   'password',
#   role:       'premium'
#   )
# premium.skip_confirmation!
# premium.save!

# standard = User.new(
#   # name:       'Standard',
#   email:      'standard@example.com',
#   password:   'password'
#   )
# standard.skip_confirmation!
# standard.save!

# users = User.all

# # Create wikis
# users.each do |user|
#   user.wikis.create!(
#     title:    Faker::Music.instrument,
#     body:     Faker::Lorem.paragraph,
#     private:  false
#   )
# end

# 10.times do
#   Wiki.create!(
#     user: users.sample,
#     title: Faker::Book.title,
#     body: Faker::Hipster.paragraph,
#     private: false
#   )
# end

# Wikis = Wiki.all

# puts "Seed finished"
# puts "#{User.count} users created"
# puts "#{Wiki.count} wikis created"