source 'https://rubygems.org'
# ruby "~> 2.3.0"
ruby '2.3.0'
# CSS framework Bootstrap gem
gem 'bootstrap-sass'
# For encrypting User passwords
gem 'bcrypt'
# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '~> 5.0.1'
# Use sqlite3 as the database for Active Record
# gem 'sqlite3'
# Use Puma as the app server
# gem 'puma', '~> 3.0'
# Use SCSS for stylesheets
gem 'sass-rails', '~> 5.0'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
# Use CoffeeScript for .coffee assets and views
gem 'coffee-rails', '~> 4.2'
# See https://github.com/rails/execjs#readme for more supported runtimes
# gem 'therubyracer', platforms: :ruby

# Use jquery as the JavaScript library
gem 'jquery-rails'
# Turbolinks makes navigating your web application faster. Read more: https://github.com/turbolinks/turbolinks
gem 'turbolinks', '~> 5'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.5'
# Figaro to store Sendgrid and Devise credentials as environment variables
gem 'figaro'

group :production do
  gem 'pg'
  gem 'rails_12factor'
end

group :development do
  gem 'sqlite3'
  gem 'listen', '~> 3.0.5'
  # gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
  # gem 'pry-rails'
end

gem 'devise'
gem 'pundit'
gem 'stripe'
gem 'redcarpet'

group :development, :test do
  gem 'rspec-rails', '~> 3.0'
  gem 'rails-controller-testing'
  gem 'shoulda'
  gem 'factory_girl_rails', '~> 4.0'
  gem 'byebug'
  gem 'web-console', '~> 2.0'
  gem 'spring'
  gem 'faker'
  gem 'pry-rails'
end


