PracticesController < ApplicationController
  def index
    if params[:user_id].present?
      @practices = User.find_by(params[:user_id]).practices
    else
      @practices = Practices.all
    end
    render :json @practices
  end
end
