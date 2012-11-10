class TransactionsController < ApplicationController
  # GET /transactions
  # GET /transactions.json
  def index
    @transactions = Transaction.all

    render json: @transactions
  end

  # GET /transactions/1
  # GET /transactions/1.json
  def show
    @transaction = Transaction.find(params[:id])

    render json: @transaction
  end

  # GET /transactions/new
  # GET /transactions/new.json
  def new
    @transaction = Transaction.new

    render json: @transaction
  end

  # POST /transactions
  # POST /transactions.json
  def create
    @transaction = Transaction.new


    ##### nur fur test!
    @transaction.venue_id = 1
    session[:current_farm_id] = 2
    #####


    @transaction.customer_id = params[:customer_id]
    @transaction.farm_id = session[:current_farm_id]
    @transaction.amount = params[:amount]

    if @transaction.save
      render json: @transaction, status: :created, location: @transaction
    else
      render json: @transaction.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /transactions/1
  # PATCH/PUT /transactions/1.json
  def update
    @transaction = Transaction.find(params[:id])

    if @transaction.update_attributes(params[:transaction])
      head :no_content
    else
      render json: @transaction.errors, status: :unprocessable_entity
    end
  end

  # DELETE /transactions/1
  # DELETE /transactions/1.json
  def destroy
    @transaction = Transaction.find(params[:id])
    @transaction.destroy

    head :no_content
  end
end
