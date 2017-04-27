
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
# users = User.all

# Create admin user for testing
  admin = User.new(
    # name: 'Admin',
    email: 'admin@maddladd.com',
    password: 'password',
    role: :admin
  )
  admin.save

# Create premium user for testing
  premium = User.new(
    # name: 'Premium',
    email: 'premium@maddladd.com',
    password: 'password',
    role: :premium
  )
  premium.save

# Create standard user for testing
  standard = User.new(
    # name: 'Standard',
    email: 'standard@maddladd.com',
    password: 'password',
    role: :standard
  )
  standard.save

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
