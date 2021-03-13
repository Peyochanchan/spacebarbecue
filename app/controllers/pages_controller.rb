class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :home
  def home
    if user_signed_in?
      @barbecues = Barbecue.where.not(user: current_user)
    else
      @barbecues = Barbecue.all
    end
    # the `geocoded` scope filters only flats with coordinates (latitude & longitude)
    @markers = @barbecues.geocoded.map do |barbecue|
      {
        lat: barbecue.latitude,
        lng: barbecue.longitude,
        infoWindow: render_to_string(partial: "info_window", locals: { barbecue: barbecue })
      }
    end
  end
end
