class BarbecuesController < ApplicationController
    def index
        @barbecues = Barbecues.all
      end
    
      def show
        @barbecue = Barbecue.find(params[:id])
      end
    
      def new
        @barbecue = Barbecue.new
      end
    
      def create
        @barbecue = Barbecue.new(barbecue_params)
        if barbecue.save
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
