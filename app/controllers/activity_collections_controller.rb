class ActivityCollectionsController < ApplicationController
	authorize_resource

	def create
		@act_collection = ActivityCollection.new
		@act_collection.activity_id = params[:collection][:activity_id]
		@act_collection.collection_id = params[:collection_id]
		@act_collection.save
		redirect_to collection_path(@act_collection.collection)
	end

	def destroy
		@act_collection = ActivityCollection.find(params[:id])
		@act_collection.destroy
		redirect_to collection_path(@act_collection.collection)
	end

end
