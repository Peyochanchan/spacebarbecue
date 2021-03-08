# frozen_string_literal: true

# :nodoc:
class LocationsController < ApplicationController
  before_action :set_params, only: %i[new create]

  def index
    @locations = Location.where(user: current_user)
  end

  def new
    @location = Location.new
  end

  def create
    @location = Location.new
    @location.status = "pending"
    @location.user_id = current_user.id
    @location.barbecue_id = @barbecue.id
    @location.start_time = params[:start_time]
    @location.end_time = params[:end_time]
    if @location.save
      redirect_to locations_path
    else
      redirect_to root_path
    end
  end

  def update
    @location.update(location_params)
  end

  def destroy
    @location.destroy
    redirect_to home_path
  end

  private

  def set_params
    @barbecue = Barbecue.find(params[:barbecue_id])
  end

  def location_params
    params.require(:location).permit(:status, :user_id, :barbecue_id, :start_time, :end_time)
  end
end
