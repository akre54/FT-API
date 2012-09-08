class FarmsController < ApplicationController
  # GET /farms
  # GET /farms.json
  def index
    @current_farm = Farm.find 2 #NUR FUR TEST
    render "farms/show" 
  end

  # POST /farms
  # POST /farms.json
  def create
    # should use something like: params.slice(:name, :email) for whitelisted attributes
    @current_farm = Farm.new(params[:farm])

    if @current_farm.save
      render json: @current_farm, status: :created, location: @farm
    else
      render json: @current_farm.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /farms/1
  # PATCH/PUT /farms/1.json
  def update
    if @current_farm.update_attributes(params[:farm])
      head :no_content
    else
      render json: @current_farm.errors, status: :unprocessable_entity
    end
  end
end
