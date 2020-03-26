class UsersController < ApplicationController
  skip_before_action :authenticate_request, :only => [:create]
  load_and_authorize_resource


  def create
    @user = User.new(user_params)
    if @user.save!
      command = AuthenticateUser.call(params[:email_address], params[:password])
      render json: {user: @user, auth_token: command.result}, status: :created
    else
      render status: :internal_server_error
    end
  end

  def update
    @current_user.assign_attributes(user_params)

    if @current_user.save
      render json: {user: @current_user, status: :ok}
    else
      render json: {status: :internal_server_error}
    end

  end

  def show
    @user = User.find(params[:id])

    if @user != nil
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
      params.permit(:first_name, :last_name, :email_address, :password, :role, :latitude, :longitude)
  end

  def profile
    if @current_user
      render json: {user: @current_user}
    else
      render json: {error: "Invalid Token"}
    end
  end

end
