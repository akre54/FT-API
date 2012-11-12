class TransactionsController < ApplicationController
  # GET /transactions
  # GET /transactions.json
  def index
    @transactions = Transaction.all

    render 'transactions/index'
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

    render 'transactions/show'
  end

  # POST /transactions
  # POST /transactions.json
  def create
    @transaction = Transaction.new

    session[:current_farm_id] = 2 # NUR FUR TEST

    @transaction.farm_id          = session[:current_farm_id]
    @transaction.customer_id      = params[:customer_id]
    @transaction.transaction_type = params[:transaction_type]
    @transaction.amount           = params[:amount]

    if @transaction.save
      render 'transactions/show', status: :created, location: @transaction
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
