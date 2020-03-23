class PracticesController < ApplicationController
  load_and_authorize_resource

  def create
    @user = User.find(params[:user_id])

    if @user != nil
      @practice = @user.practices.new(practice_params)
    else
      render :not_found
    end

    if @practice.save
      render json: {practice: @practice, status: :created}
    else
      render status: :internal_server_error
    end

  end

  def index

    @practices = @current_user.practices

    if @practices
      render json: {practices: @practices, status: :ok}
    else
      render json: {error: 'Could not find Practices.'}
    end

  end

  def show
    @practice = Practice.find(params[:id])

    if @practice != nil
      render json: @practice
    else
      render :not_found
    end
  end

  def practice_params
      params.permit(:name, :contact, :user_id, :staff)
  end

end
