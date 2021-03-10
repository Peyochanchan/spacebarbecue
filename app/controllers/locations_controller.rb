# frozen_string_literal: true

# :nodoc:
class LocationsController < ApplicationController
  before_action :set_params, only: %i[update destroy]

  def index
    @locations = Location.where(user: current_user)
  end

  def show
    @barbecue = Barbecue.find(params[:barbecue_id])
    @location = Location.find(params[:id])
  end

  def new
    @barbecue = Barbecue.find(params[:barbecue_id])
    @location = Location.new
  end

  def create
    @barbecue = Barbecue.find(params[:barbecue_id])
    @location = Location.new
    @location.status = "pending"
    @location.user_id = current_user.id
    @location.barbecue_id = @barbecue.id
    @location.start_time = params[:start_time]
    @location.end_time = params[:end_time]
    if @location.save
      redirect_to locations_path
    else
    end
  end

  def update
    # if params[:accept] == "ACCEPT"
    #   @location.status = "accepted"
    # else
    #   params[:decline] == "DECLINE"
    #   @location.status = "declined"
    #   redirect_to location_path(@location), method: :delete, notice: { alert: "Are You Sure" }
      @location.update(location_params)
        redirect_to locations_path
    end
  end

  def destroy
    @location.destroy
    redirect_to locations_path
  end

  private

  def set_params
    @location = Location.find(params[:id])
  end

  def location_params
    params.require(:location).permit(:status, :user_id, :barbecue_id, :start_time, :end_time)
  end
end
