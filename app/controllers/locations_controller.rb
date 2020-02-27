class LocationsController < ApplicationController
  def index
    if params[:practice_id].present?
      @locations = Practice.find_by(params[:practice_id]).locations
    else
      @locations = Locations.all
    end
    render :json @locations
  end
end
