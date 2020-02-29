class LocationsController < ApplicationController

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
    if params[:id].present?
      @locations = Practice.find(params[:id]).locations
    else
      @locations = Location.all
    end
    render json: @locations
  end

  def search

    @search_distance = params[:search_distance] || 10

    if params[:latitude] != nil and params[:longitude] !=nil and params[:services] != nil
      @locations = Location.near([params[:latitude],params[:longitude]], @search_distance).where('services @> ?', {services:params[:services]}.to_json)
    elsif
      @locations = Location.near([params[:latitude],params[:longitude]], @search_distance)
    else
      render json: {"error":"Location data missing!"}
      return
    end

    if params[:services] != nil
      @unfiltered_locations = @locations
      @locations = @unfiltered_locations
    end

    render json: @locations
  end

  def location_params
      params.permit(:name, :address, :phone_number, :contact, :services, :practice_id, :staff, :latitude, :longitude)
  end
end
