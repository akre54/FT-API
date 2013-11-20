# This file is used by Rack-based servers to start the application.

require ::File.expand_path('../config/environment',  __FILE__)

use Rack::Cors do
  allow do
    origins 'localhost:3333', 'm.farmtab.com', 'farmtab.com'
    resource '*', headers: :any, methods: [:get, :post, :patch, :put, :delete]
  end
end
run FTApi::Application
