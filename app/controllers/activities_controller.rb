class ActivitiesController < ApplicationController
	

	def show
		@activity = Activity.find(params[:id])
		authorize! :show, @activity
		if user_signed_in?

			@contacts = User.find(current_user.id).contacting
	      	@contacts_activity = []
	      	@activity.users.each do |user|
	        	@contacts.each do |contact|
	          		if user.id == contact.followed_id
	            		@contacts_activity << User.find(contact.followed_id)
	          		end
	        	end
	      	end

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
		authorize! :new, @activity
		@categories = Category.all

	end

	def create
		@activity = Activity.new
		@activity.name = params[:activity][:name]
		@activity.category_id = params[:activity][:category_id]
		@activity.photo = params[:activity][:photo]
		@activity.remote_photo_url = params[:activity][:remote_photo_url]
		@activity.owner_id = current_user.id
		@activity.latitude = params[:activity][:latitude]
		@activity.longitude = params[:activity][:longitude]
		authorize! :create, @activity
		@activity.save
		redirect_to root_path, notice: 'la actividad fue creada. Puede ingresarla a su registro si lo desea'
	end

	def edit
		@activity = Activity.find(params[:id])
		authorize! :edit, @activity
		@categories = Category.all
		
	end

	def update
		@activity = Activity.find(params[:id])
		authorize! :update, @activity
		@activity.update(name: params[:activity][:name])
		@activity.update(author: params[:activity][:author])
		@activity.update(category_id: params[:activity][:category_id])
		@activity.update(photo: params[:activity][:photo])
		@activity.update(remote_photo_url: params[:activity][:remote_photo_url])
		@activity.update(latitude: params[:activity][:latitude])
		@activity.update(longitude: params[:activity][:longitude])
    	redirect_to user_path(current_user)
	end

	def destroy
		@activity = Activity.find(params[:id])
		authorize! :destroy, @activity
		@activity.destroy
		redirect_to pages_configuration_path, notice: 'la actividad fue borrada'
	end
	
end
