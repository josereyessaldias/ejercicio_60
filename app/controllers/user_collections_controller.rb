class UserCollectionsController < ApplicationController

	def create
		@user_collection = UserCollection.new
		@user_collection.user_id = current_user.id
		@user_collection.collection_id = params[:collection_id]
		@user_collection.status = 1
		authorize! :create, @user_collection
		@user_collection.save
		redirect_to root_path
	end

	def destroy
		@user_collection = UserCollection.where(user_id: current_user.id, collection_id: params[:id]).first
		authorize! :destroy, @user_collection
		@user_collection.destroy
		redirect_to root_path
	end
end
