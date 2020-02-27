class UsersController < ApplicationController
  def create
    @user = User.new(user_params)
    if @user.save
      render json: @user, status: :created
    else
      render status: :internal_server_error
    end
  end

  def show
    @user = User.find(params[:user_id])

    if @user != null
      render json: @user
    else
      render :not_found
    end
  end

  def index
    @users = User.all

    render json: @users
  end

  def user_params
      params.require(:first_name, :last_name, :email_address, :role)
  end

end
