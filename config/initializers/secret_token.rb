# Be sure to restart your server when you modify this file.

# Your secret key for verifying the integrity of signed cookies.
# If you change this key, all old signed cookies will become invalid!
# Make sure the secret is at least 30 characters and all random,
# no regular words or you'll be exposed to dictionary attacks.

# if ENV["SECRET_TOKEN"].blank? && Rails.env.production?
#   raise "You must set ENV[\"SECRET_TOKEN\"] in your app's config vars"
# end

FTApi::Application.config.secret_token = ENV["SECRET_TOKEN"] || '1b6fbfee5b9318badcbb43dd34d03127b27cee1fa98d285638f35fc75537'
