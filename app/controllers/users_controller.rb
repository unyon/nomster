class UsersController < ApplicationController

	def show
			@user = User.where(id: params[:id]).first
		if @user.blank?
			render text: "Not found", status: :not_found
	    end
	end

end