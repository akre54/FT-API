source 'https://rubygems.org'

#base
gem 'rails', '3.2.6'
gem 'rails-api'
gem 'thin'
gem 'rack-cors', :require => 'rack/cors'

#views
gem 'rabl'

#deployment
gem 'heroku'

group :production do
    gem 'pg'
end

group :development, :test do
  gem 'sqlite3'
  gem 'pry-rails'
  gem 'debugger-pry', require: 'debugger/pry'
  gem 'debugger'
  gem 'rspec-rails'

  # stubs and mocks
  gem 'factory_girl'
  gem 'factory_girl_rails'
  gem 'faker'
end


# To use ActiveModel has_secure_password
# gem 'bcrypt-ruby', '~> 3.0.0'

# To use Jbuilder templates for JSON
# gem 'jbuilder'

# Use unicorn as the app server
# gem 'unicorn'

# Deploy with Capistrano
# gem 'capistrano', :group => :development

# To use debugger
# gem 'ruby-debug19', :require => 'ruby-debug'
