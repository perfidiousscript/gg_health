class PracticesController < ApplicationController
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

end
