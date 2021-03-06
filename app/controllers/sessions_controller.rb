class SessionsController < ApplicationController
  def create
    farm = Farm.find_by_email(params[:email])
    if farm && farm.authenticate(params[:password])
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
