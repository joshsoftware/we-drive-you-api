# frozen_string_literal: true

source "https://rubygems.org"
git_source(:github) {|repo| "https://github.com/#{repo}.git" }

ruby "2.6.3"

#To load environment variables from .env into ENV in development
gem 'dotenv-rails', groups: [:development, :test]

#For sending mail using sendgrid
gem 'sendgrid-ruby'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem "rails", "~> 6.0", ">= 6.0.2.1"
# Use postgresql as the database for Active Record
gem "pg", ">= 0.18", "< 2.0"
# Use Puma as the app server
gem "puma", "~> 3.11"

gem "overcommit"
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
# gem 'jbuilder', '~> 2.5'
# Use Redis adapter to run Action Cable in production
# gem 'redis', '~> 4.0'
# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# Use ActiveStorage variant
# gem 'mini_magick', '~> 4.8'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

# Reduces boot times through caching; required in config/boot.rb
gem "bootsnap", ">= 1.1.0", require: false
gem "versionist"
gem "webpacker"
# Use Rack CORS for handling Cross-Origin Resource Sharing (CORS), making cross-origin AJAX possible

gem "apartment", github: "influitive/apartment", branch: "development"
gem "rack-cors"

group :development, :test do
  gem "byebug", platforms: %i[mri mingw x64_mingw]
  gem "faker", "~> 2.10", ">= 2.10.1"
  gem "rspec-rails", "~> 3.9"
  gem "rubocop", "~> 0.79.0", require: false
end

group :development do
  gem "listen", ">= 3.0.5", "< 3.2"
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem "brakeman"
  gem "spring"
  gem "spring-watcher-listen", "~> 2.0.0"
end

group :test do
  gem "simplecov", require: false
end
# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem "tzinfo-data", platforms: %i[mingw mswin x64_mingw jruby]
# gem 'jwt'
