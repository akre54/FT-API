class ApplicationController < ActionController::API
  @current_farm = Farm.find 2 
end
