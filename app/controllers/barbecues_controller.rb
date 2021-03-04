# frozen_string_literal: true

# :nodoc:
class BarbecuesController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[index show]
  def index
    @barbecues = Barbecue.all
  end

  def show
    @barbecue = Barbecue.find(params[:id])
  end

  def new
    @barbecue = Barbecue.new
  end

  def create
    @barbecue = Barbecue.new(barbecue_params)
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
    @barbecue.destroy
    redirect_to root_path
  end

  private

  def barbecue_params
    params.require(:barbecue).permit(:title, :description, :price)
  end
end
