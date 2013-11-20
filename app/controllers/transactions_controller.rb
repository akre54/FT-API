class TransactionsController < ApplicationController
  # GET /transactions
  def index
    @transactions = Tab.find_all_by_farm_id(current_farm.id).map(&:transactions).flatten

    render 'transactions/index'
  end

  # GET /transactions/1
  def show
    @transaction = Transaction.find params[:id]

    if @transaction && @transaction.farm == current_farm
      render 'transactions/show'
    else
      render json: {errors: ["Could not find transaction with id #{params[:id]} for this farm"]}, status: :not_found
    end
  end

  # POST /transactions
  def create
    @transaction = Transaction.new
    @transaction.transaction_type = params[:transaction_type]
    @transaction.amount           = params[:amount]

    @tab = Tab.find_by_farm_id_and_customer_id(current_farm.id, params[:customer_id])

    if @tab.transactions << @transaction
      render 'transactions/show', status: :created, location: @transaction
    else
      render json: @transaction.errors.full_messages, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /transactions/1
  def update
    @transaction = Transaction.find(params[:id])

    if @transaction.update_attributes(params[:transaction])
      head :no_content
    else
      render json: @transaction.errors.full_messages, status: :unprocessable_entity
    end
  end

  # DELETE /transactions/1
  # DELETE /transactions/1.json
  def destroy
    Transaction.find(params[:id]).try(:destroy)

    head :no_content
  end
end
