module V1
  class FarmsController < ApplicationController
    # GET /farms
    def show_current
      @current_farm = current_farm
      render 'farms/show'
    end
  end
end
