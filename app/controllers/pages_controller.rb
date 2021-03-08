class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :home
  def home
    if user_signed_in?
      @barbecues = Barbecue.where.not(user: current_user)
    else
      @barbecues = Barbecue.all
    end
  end
end
