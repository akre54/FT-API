class SessionsController < ApplicationController
  def new
  end

  def create
    farm = Farm.authenticate(params[:email], params[:password])
    if farm
      session[:current_farm_id] = farm.id
      redirect_to my_farm
    else
      render json: {result: 'auth_failure', errors: ['Invalid email or password']}, status: :unauthorized
    end
  end

  def destroy
    session[:current_farm_id] = nil
    render json: {result: 'success', errors: []}
  end
end
