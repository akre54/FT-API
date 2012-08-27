class FarmsController < ApplicationController
  # GET /farms
  # GET /farms.json
  def index
    @farm = Farm.find(@current_farm.id)

    render json: @farm
  end

  # POST /farms
  # POST /farms.json
  def create
    @farm = Farm.new(params[:farm])

    if @farm.save
      render json: @farm, status: :created, location: @farm
    else
      render json: @farm.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /farms/1
  # PATCH/PUT /farms/1.json
  def update
    @farm = Farm.find(params[:id])

    if @farm.update_attributes(params[:farm])
      head :no_content
    else
      render json: @farm.errors, status: :unprocessable_entity
    end
  end

  # DELETE /farms/1
  # DELETE /farms/1.json
  def destroy
    @farm = Farm.find(params[:id])
    @farm.destroy

    head :no_content
  end
end
