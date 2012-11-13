class ApplicationController < ActionController::API
    helper_method :current_farm
    before_filter :set_test_farm
    
    def set_test_farm
      session[:current_farm_id] = 2
    end

    def current_farm
      @_current_farm ||= session[:current_farm_id] &&
        Farm.find_by_id(session[:current_farm_id])
    end
end
