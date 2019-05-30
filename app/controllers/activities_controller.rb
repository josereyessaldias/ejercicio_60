class ActivitiesController < ApplicationController
	load_and_authorize_resource

	def show
		@activity = Activity.find(params[:id])
		if user_signed_in?
			@user_act = UserActivity.where(user_id: current_user.id,activity_id: @activity.id)
			if @user_act != []
				if @user_act.first.status == 'realizada'				
					@registrada = true
					@user_activity = @user_act.first
				else
					@registrada = false
					@user_activity = @user_act.first
				end
			else
				@registrada = nil
			end
		end
	end

	def new
		@activity = Activity.new
		@categories = Category.all
	end

	def create
		@activity = Activity.new
		@activity.name = params[:activity][:name]
		@activity.category_id = params[:activity][:category_id]
		@activity.photo = params[:activity][:photo]
		@activity.remote_photo_url = params[:activity][:remote_photo_url]
		@activity.owner_id = current_user.id
		@activity.save
		redirect_to root_path, notice: 'la actividad fue creada. Puede ingresarla a su registro si lo desea'
	end

	def edit
		@activity = Activity.find(params[:id])
		@categories = Category.all
		
	end

	def update
		@activity = Activity.find(params[:id])
		authorize! :uoda, @activity
		@activity.update(name: params[:activity][:name])
		@activity.update(author: params[:activity][:author])
		@activity.update(category_id: params[:activity][:category_id])
		@activity.update(photo: params[:activity][:photo])
		@activity.update(remote_photo_url: params[:activity][:remote_photo_url])
    	redirect_to user_path(current_user)
	end

	
	
end
