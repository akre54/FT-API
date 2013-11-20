class FarmsController < ApplicationController
  # GET /farms
  def show_current
    @current_farm = current_farm
    render 'farms/show', location: @current_farm
  end
end
