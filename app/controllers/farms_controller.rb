class FarmsController < ApplicationController
  # GET /farms
  def index
    show_current
  end

  def show_current
    @current_farm = current_farm
    render 'farms/show', location: @current_farm
  end

  # POST /farms
  def create
    # should use something like: params.slice(:name, :email) for whitelisted attributes
    @current_farm = Farm.new(params[:farm])

    if @current_farm.save
      render 'farms/show', status: :created, location: @current_farm
    else
      render json: {errors: @current_farm.errors}, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /farms/1
  def update
    if @current_farm.update_attributes(params[:farm])
      render 'farms/show', status: :accepted, location: @current_farm
    else
      render json: {errors: @current_farm.errors}, status: :unprocessable_entity
    end
  end
end
