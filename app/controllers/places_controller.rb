class PlacesController < ApplicationController
	before_action :authenticate_user!, :only => [:new, :create, :edit, :update, :destroy]



def index
	@places = Place.all.paginate(:page => params[:page], :per_page => 10).order('created_at ASC')
end


def new
	@places = Place.news
end

def create
	current_user.places.create(place_params)
	redirect_to root_path
end

def show
	@place = Place.find(params[:id])
end

def edit
	@place = Place.find(params[:id])

	if @place.user != current_user 
		return render :text => 'Not allowed', :status => :forbidden
	end
end

def update

	if @place.user != current_user 
		return render :text => 'Not allowed', :status => :forbidden
	end

	@place = Place.find(params[:id])
	@place.update_attributes(place_params)
	redirect_to root_path
end

def destroy
	
	if @place.user != current_user 
		return render :text => 'Not allowed', :status => :forbidden
	end
	
	@place = Place.find(params[:id])
	@place.destroy
	redirect_to root_path
end


private

def place_params
	params.require(:place).permit(:name, :address, :description)
end


end
