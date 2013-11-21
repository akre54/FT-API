module V1
  class CustomersController < ApplicationController
    # GET /customers
    def index
      @current_farm = current_farm
      render "customers/index"
    end

    # GET /customers/1
    def show
      @customer = Customer.find(params[:id])
      @current_farm = current_farm
      if @customer && @customer.tabs.find_by_farm_id(@current_farm)
        render "customers/show"
      else
        render json: {errors: ["Could not find customer with id #{params[:id]} for this farm"]}, status: :not_found
      end
    end

    # GET /customers/new
    def new
      @customer = Customer.new
      render "customers/show"
    end

    # POST /customers
    def create
      @customer = Customer.find_by_email params[:email]
      @current_farm = current_farm

      unless @customer
        @customer = Customer.new
        @customer.name = params[:name]
        @customer.email = params[:email]
        @customer.password = params[:pin] # do something with this
      end

      if @current_farm.customers << @customer
        render "customers/show", status: :created, location: @customer
      else
        render json: {errors: @customer.errors.full_messages}, status: :unprocessable_entity
      end
    end

    # PATCH/PUT /customers/1
    def update
      @customer = Customer.find(params[:id])

      if @customer.update_attributes(params[:customer])
        head :no_content
      else
        render json: {errors: @customer.errors.full_messages}, status: :unprocessable_entity
      end
    end

    # DELETE /customers/1
    def destroy
      @customer = Customer.find(params[:id])
      @customer.destroy

      head :no_content
    end
  end
end
