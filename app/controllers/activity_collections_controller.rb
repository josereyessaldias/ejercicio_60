class ActivityCollectionsController < ApplicationController
	

	def create
		@act_collection = ActivityCollection.new
		@act_collection.activity_id = params[:collection][:activity_id]
		@act_collection.collection_id = params[:collection_id]
		authorize! :create, @act_collection
		@act_collection.save
		redirect_to collection_path(@act_collection.collection)
	end

	def destroy
		@act_collection = ActivityCollection.find(params[:id])
		authorize! :destroy, @act_collection
		@act_collection.destroy
		redirect_to collection_path(@act_collection.collection)
	end

end
