class PlacesController < ApplicationController

	def new
		@place = Place.new
	end

	def show
	  	@place = Place.find(params[:id])
	end

	def create
	  	@place = Place.new(place_params)
	  	if @place.save
	  		flash[:success] = "Place created!"
	  		redirect_to @place
	  	else
	  		render 'new'
	  	end
	end



	private

	def place_params
  	params.require(:place).permit(:name,
  								  :description,
  								  :lat,
                                  :lng,
                                  :address)
  end
end
