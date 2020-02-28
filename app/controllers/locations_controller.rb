class LocationsController < ApplicationController
  def index
    if params[:id].present?
      @locations = Practice.find(params[:id]).locations
    else
      @locations = Location.all
    end
    render json: @locations
  end
end
