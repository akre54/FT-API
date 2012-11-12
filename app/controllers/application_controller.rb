class ApplicationController < ActionController::API

    before_filter :set_test_farm
    
    private

    def set_test_farm
        session[:current_farm_id] = 3
    end

    def current_farm
        @_current_farm ||= session[:current_farm_id] &&
            Farm.find_by_id(session[:current_farm_id])
    end
end
