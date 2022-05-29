class UsersController < ApplicationController
  def index
  end

  def create
    user = User.create!(user_params)
    render json: user, status: :created
  rescue Exception => e
    render json: e, status: :internal_server_error
  end

  private
  def user_params
    params.permit(
      :first_name,
      :last_name
    )
  end
  
end
