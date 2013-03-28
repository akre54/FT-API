class ApplicationController < ActionController::API
    before_filter :set_test_farm

    protect_from_forgery
    force_ssl

    def set_test_farm
      puts "NUR FOR TEST!"
      session[:current_farm_id] = 2
    end

    def current_farm
      @current_farm ||= Farm.find(session[:current_farm_id]) if session[:current_farm_id]
    end

    helper_method :current_farm
end
