# frozen_string_literal: true

# :nodoc:
class BarbecuesController < ApplicationController
  before_action :set_barbecue, only: %i[show edit update destroy booking]
  skip_before_action :authenticate_user!, only: %i[index show]

  def index
    @barbecues = Barbecue.where(user: current_user)
  end

  def show
    @markers = {
      lng: @barbecue.longitude,
      lat: @barbecue.latitude
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
  end

  def update
    @barbecue.update(barbecue_params)
    redirect_to barbecue_path(@barbecue)
  end

  def destroy
    @barbecue.destroy
    redirect_to root_path
  end

  def booking
    @start_time = params[:start_time]
    @end_time = params[:end_time]
    @location = Location.new
  end

  def search
    @barbecues = Barbecue.where("title LIKE '%#{params[:search]}%' OR address LIKE '%#{params[:search]}%'")
    @total = Barbecue.count
    @request = params[:search]
    @markers = @barbecues.geocoded.map do |barbecue|
      {
        lat: barbecue.latitude,
        lng: barbecue.longitude
      }
    end
  end

  private

  def set_barbecue
    @barbecue = Barbecue.find(params[:id])
  end

  def barbecue_params
    params.require(:barbecue).permit(:title, :description, :address, :price, :photo)
  end
end
