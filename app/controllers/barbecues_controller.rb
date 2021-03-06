# frozen_string_literal: true

# :nodoc:
class BarbecuesController < ApplicationController
  before_action :set_barbecue, only: [:show, :edit, :update, :destroy, :booking]
  skip_before_action :authenticate_user!, only: %i[index show]

  def index
    if user_signed_in?
      @barbecues = Barbecue.where.not(user: current_user)
    else
      @barbecues = Barbecue.all
    end
  end

  def show
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

  private

  def set_barbecue
    @barbecue = Barbecue.find(params[:id])
  end

  def barbecue_params
    params.require(:barbecue).permit(:title, :description, :price, :photo)
  end
end
