class CustomersController < ApplicationController
  # GET /customers
  # GET /customers.json
  def index
    @current_farm = current_farm
    render "customers/index"
  end

  # GET /customers/1
  # GET /customers/1.json
  def show
    @customer = Customer.find(params[:id])
    @current_farm = current_farm
    render "customers/show"
  end

  # GET /customers/new
  # GET /customers/new.json
  def new
    @customer = Customer.new
    render "customers/show"
  end

  # POST /customers
  # POST /customers.json
  def create
    @customer = Customer.new

    @customer.name = params[:name]
    @customer.email = params[:email]
    @customer.crypted_pin = params[:pin] # do something with this
    @customer.salt = 'hagg1s' # do something with this

    if current_farm.customers << @customer
      render "customers/show", status: :created, location: @customer
    else
      render json: @customer.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /customers/1
  # PATCH/PUT /customers/1.json
  def update
    @customer = Customer.find(params[:id])

    if @customer.update_attributes(params[:customer])
      head :no_content
    else
      render json: @customer.errors, status: :unprocessable_entity
    end
  end

  # DELETE /customers/1
  # DELETE /customers/1.json
  def destroy
    @customer = Customer.find(params[:id])
    @customer.destroy

    head :no_content
  end
end
