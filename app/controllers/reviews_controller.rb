class ReviewsController < ApplicationController
    def new
        @review=Review.new
        @location=Location.find(params[:location_id])
    end

    def create
        @review=Review.new(review_params)
        location = Location.find(params[:location_id])
        @barbecue = location.barbecue
        @review.barbecue = @barbecue
        @review.user = current_user
        if @review.save
          redirect_to locations_path
        else
          redirect_to root_path
        end
    end

private

    def review_params
      params.require(:review).permit(:content)
    end 

end
