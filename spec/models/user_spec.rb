require 'rails_helper'

RSpec.describe User, type: :model do
  it 'password length less than 5 characters is invalid' do
    user = User.new(email: 'elfman@gmail.com', password: '1234')
    result = user.save
    expect(result).to be(false)
  end

  it 'password length must be atleast 5 characters' do
    user = User.new(email: 'elfman@gmail.com', password: '12345')
    result = user.save
    expect(result).to be(true)
  end

  it 'email must be unique' do
    user = User.new(email: 'elfman@gmail.com', password: '12345')
    user.save

    u = User.new(email: 'elfman@gmail.com', password: '12345')
    u.save
    expect(u.errors.get(:email)).to eq(["has already been taken"])
  end

  it 'email with invalid format is invalid' do
    user = User.new(email: 'elfman', password: '12345')
    user.save
    expect(user.errors.get(:email)).to eq(['is invalid'])
  end
end