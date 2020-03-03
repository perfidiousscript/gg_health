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
      render @practice, status: :created
    else
      render status: :internal_server_error
    end

  end

  def index
    if params[:user_id].present?
      @practices = User.find(params[:user_id]).practices
    else
      @practices = Practice.all
    end
    render json: @practices
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
