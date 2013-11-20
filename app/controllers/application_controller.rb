class ApplicationController < ActionController::API
    before_filter :set_test_farm

    force_ssl unless Rails.env.development?

    private

    def set_test_farm
      puts "NUR FOR TEST!"
      session[:current_farm_id] = 1
    end

    def current_farm
      @current_farm ||= Farm.find(session[:current_farm_id]) if session[:current_farm_id]
    end

    helper_method :current_farm
end
