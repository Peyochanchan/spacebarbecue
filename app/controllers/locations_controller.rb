# frozen_string_literal: true

# :nodoc:
class LocationsController < ApplicationController
  def new
    @barbecue = Barbecue.find(params[:barbecue_id])
  end

  def index
    @locations = Location.where(user: current_user)
  end

  def create
    @location = Location.new
    @location.status = "pending"
    @location.user_id = current_user.id
    @barbecue = Barbecue.find(params[:barbecue_id])
    @location.barbecue_id = @barbecue.id
    if @location.save
      redirect_to locations_path
    else

    end
  end

  def update
    @location.update(location_params)
  end

  private

  def location_params
    params.require(:location).permit(:status, :user_id, :barbecue_id)
  end
end
