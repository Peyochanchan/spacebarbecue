# frozen_string_literal: true

# :nodoc:
class BarbecuesController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[index show]
  def index
    @barbecues = Barbecue.all
  end

  def show
    @barbecue = Barbecue.find(params[:id])
    @markers = {
      lat: @barbecue.latitude,
      long: @barbecue.longitude
    }
  end

  def new
    @barbecue = Barbecue.new
  end

  def create
    @barbecue = Barbecue.new(barbecue_params)
    @barbecue.user = current_user
    if @barbecue.save
      redirect_to barbecue_path(@barbecue)
    else
      render "new"
    end
  end

  def edit
    @barbecue = Barbecue.find(params[:id])
  end

  def update
    @barbecue.update(barbecue_params)
    redirect_to barbecue_path(@barbecue)
  end

  def destroy
    @barbecue = Barbecue.find(params[:id])
    @barbecue.destroy
    redirect_to root_path
  end

  def booking
    @barbecue = Barbecue.find(params[:id])
    @start_time = params[:start_time]
    @end_time = params[:end_time]
    @location = Location.new
  end

  private

  def barbecue_params
    params.require(:barbecue).permit(:title, :description, :address, :price, :photo)
  end
end
