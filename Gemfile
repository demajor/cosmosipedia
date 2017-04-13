source 'https://rubygems.org'

ruby '2.3.0'
# CSS framework Bootstrap gem
gem 'bootstrap-sass'
#  Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby] 
# For encrypting User passwords
gem 'bcrypt'
# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '~> 5.0.1'
# Use SCSS for stylesheets
gem 'sass-rails', '~> 5.0'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
# Use CoffeeScript for .coffee assets and views
gem 'coffee-rails', '~> 4.2.1'
# Use jquery as the JavaScript library
gem 'jquery-rails'
# Turbolinks makes navigating your web application faster. Read more: https://github.com/turbolinks/turbolinks
gem 'turbolinks', '~> 5'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.5'
# Figaro to store Sendgrid and Devise credentials as environment variables
gem 'figaro'
gem 'devise'
gem 'pundit'
gem 'stripe'
gem 'redcarpet'

group :development, :test do
  gem 'rspec-rails', '~> 3.0'
  gem 'rails-controller-testing'
  gem 'shoulda'
  gem 'factory_girl_rails', '~> 4.0'
  gem 'byebug', platform: :mri  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'faker'
  gem 'pry-rails'
end

group :development do
  gem 'sqlite3'                 # Use sqlite3 as the database for Active Record
  gem 'web-console', '~> 2.0'
  gem 'listen', '~> 3.0.5'
  gem 'spring'                  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring-watcher-listen', '~> 2.0.0'
end

# always use: "bundle install --without production" command to install gems during development
group :production do
  gem 'pg'
  gem 'rails_12factor'
end

# See https://github.com/rails/execjs#readme for more supported runtimes
# gem 'therubyracer', platforms: :ruby
# Use Puma as the app server
# gem 'puma', '~> 3.0'

