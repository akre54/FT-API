class ApplicationController < ActionController::API
    helper_method :current_farm
    before_filter :set_test_farm

    def set_test_farm
      puts "NUR FOR TEST!"
      session[:current_farm_id] = 2
    end

    def current_farm
      @current_farm ||= Farm.find(session[:current_farm_id]) if session[:current_farm_id]
    end
end
