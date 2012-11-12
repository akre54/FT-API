class TransactionsController < ApplicationController
  # GET /transactions
  # GET /transactions.json
  def index
    @transactions = Transaction.find_all_by_farm_id session[:current_farm_id]

    render 'transactions/index'
  end

  # GET /transactions/1
  # GET /transactions/1.json
  def show
    session[:current_farm_id] = 2
    @transaction = Transaction.find_by_id_and_farm_id params[:id], session[:current_farm_id]

    if @transaction
      render 'transactions/show'
    else
      head :not_found
    end
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
