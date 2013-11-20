source 'https://rubygems.org'

# base
gem 'rails', '3.2.12'
gem 'rails-api'
gem 'thin'

# for cross-origin requests (m.ft.com --> api.ft.com)
gem 'rack-cors', require: 'rack/cors'

# for ActiveModel has_secure_password
gem 'bcrypt-ruby', '~> 3.0.0'

# views
gem 'rabl'

group :production do
  gem 'pg'
end

group :development, :test do
  gem 'pry-rails'
  gem 'debugger-pry', require: 'debugger/pry'
  gem 'debugger'
end

group :test do
  # testing
  gem 'rspec-rails'

  # stubs and mocks
  gem 'factory_girl'
  gem 'factory_girl_rails'
  gem 'faker'
end
