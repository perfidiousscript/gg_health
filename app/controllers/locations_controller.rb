class LocationsController < ApplicationController
  load_and_authorize_resource

  def create
    @Practice = Practice.find(params[:practice_id])

    if @Practice
      @Location = Location.new(location_params)
    else
      render json: {error: "Practice not found."}
    end

    if @Location.save
      render json: @Location, status: :created
    else
      render json: {error: "Could not save location."}
    end

  end

  def index
    locations = {}

    if params[:practice_id].present?
      locations = Practice.find(params[:practice_id]).locations
    else
      locations = Location.all
    end

    grouped_locations = group_locations(locations)

    render json: {locations: grouped_locations, status: :ok}
  end

  def search

    search_distance = params[:search_distance] || 10

    if params[:services] != nil
      locations = Location.near([params[:latitude],params[:longitude]], search_distance).where('services @> ?', {services:params[:services]}.to_json)
    elsif params[:latitude] != nil and params[:longitude] !=nil
      locations = Location.near([params[:latitude],params[:longitude]], search_distance)
    else
      render json: {"error":"Location data missing!"}
      return
    end

    grouped_locations = group_locations(locations)

    render json: {locations: grouped_locations, status: :ok}
  end

  def location_params
      params.permit(:name, :address, :phone_number, :contact, :services, :practice_id, :staff, :latitude, :longitude)
  end

  private

  def group_locations(locations)
    grouped_locations = {}

    locations.each do |location|
      service_type = location.services["primary_service"]
      if grouped_locations[service_type]
        grouped_locations[service_type][:locations].push(location)
      else
        initial_hash = {locations: [location]}
        grouped_locations[service_type] = initial_hash
      end
    end

    grouped_locations
  end

end
