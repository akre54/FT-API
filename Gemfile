source 'https://rubygems.org'
ruby '2.0.0'

# base
gem 'rails', '4.0.1'
gem 'rails-api'
gem 'thin'

# for cross-origin requests (m.ft.com --> api.ft.com)
gem 'rack-cors', require: 'rack/cors'

# for ActiveModel has_secure_password
gem 'bcrypt-ruby', '~> 3.1.2'

# views
gem 'rabl'

group :production do
  gem 'pg'
end

group :development, :test do
  gem 'pry-rails'
  gem 'pry-byebug'
  gem 'byebug'
end

group :test do
  # testing
  gem 'rspec-rails'

  # stubs and mocks
  gem 'factory_girl'
  gem 'factory_girl_rails'
  gem 'faker'
end
