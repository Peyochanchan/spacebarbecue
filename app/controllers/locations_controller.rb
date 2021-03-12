# frozen_string_literal: true

# :nodoc:
class LocationsController < ApplicationController
  before_action :set_params, only: %i[show update destroy]

  def index
    @locations = Location.where(user: current_user)
  end

  def show
    @barbecue = Barbecue.find(params[:barbecue_id])
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
      redirect_to root_path
    end
  end

  def update
    case params[:status]
    when "accepted"
      @location.update_attribute(:status, "accepted")
    when "declined"
      @location.update_attribute(:status, "declined")
    when "canceled"
      @location.update_attribute(:status, "canceled")
    end
    redirect_to barbecues_path
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
