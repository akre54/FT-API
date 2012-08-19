class TabsController < ApplicationController
  # GET /tabs
  # GET /tabs.json
  def index
    @tabs = Tab.all

    render json: @tabs
  end

  # GET /tabs/1
  # GET /tabs/1.json
  def show
    @tab = Tab.find(params[:id])

    render json: @tab
  end

  # GET /tabs/new
  # GET /tabs/new.json
  def new
    @tab = Tab.new

    render json: @tab
  end

  # POST /tabs
  # POST /tabs.json
  def create
    @tab = Tab.new(params[:tab])

    if @tab.save
      render json: @tab, status: :created, location: @tab
    else
      render json: @tab.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /tabs/1
  # PATCH/PUT /tabs/1.json
  def update
    @tab = Tab.find(params[:id])

    if @tab.update_attributes(params[:tab])
      head :no_content
    else
      render json: @tab.errors, status: :unprocessable_entity
    end
  end

  # DELETE /tabs/1
  # DELETE /tabs/1.json
  def destroy
    @tab = Tab.find(params[:id])
    @tab.destroy

    head :no_content
  end
end
