class ApplicationController < ActionController::API

    
    private

    def current_farm
        @_current_farm ||= session[:current_farm_id] &&
            Farm.find_by_id(session[:current_farm_id])
    end
end
