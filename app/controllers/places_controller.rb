class PlacesController < ApplicationController
	before_action :authenticate_user!, :only => [:new, :create]

def index
	@places = Place.all.paginate(:page => params[:page], :per_page => 10)
end


def new
	@places = Place.new
end

def create
	current_users.places.create(place_params)
	redirect_to root_path
end

def show
	@place = Place.find(params[:id])
end

def edit
	@place = Place.find(params[:id])
end

def update
	@place = Place.find(params[:id])
	@places.update_attributes(place_params)
	redirect_to root_path
	end

private

def place_params
	params.require(:place).permit(:name, :address, :description)
end


end
