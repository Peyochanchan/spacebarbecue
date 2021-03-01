# frozen_string_literal: true

# :nodoc:
class LocationsController < ApplicationController
  def index
    @locations = Location.all
    @user = User.find(params[:user_id])
  end

  def create
    @user = User.find(params[:user_id])
    @location = Location.new(location_params)
    @location.user = @user
    if @location.save
      redirect_to locations_path
    else
      render :new
    end
  end

  def update
    @location.update(location_params)
  end

  private

  def location_params
    params.require(:location).permit(:status)
  end
end
