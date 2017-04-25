require 'faker'

FactoryGirl.define do
  pw = Faker::Lorem.characters(6)
  factory :user do
    sequence(:email) { |n| "user#{n}@factory.com" }
    password pw
    password_confirmation pw
    confirmed_at Time.now
    role :standard
  end
end


# FactoryGirl.define do
#   factory :user do
    
#   end
# end