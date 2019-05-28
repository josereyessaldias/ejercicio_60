class CollectionsController < ApplicationController
	authorize_resource
  def show
  	@collection = Collection.find(params[:id])

  	if user_signed_in?
	  	if UserCollection.where(user_id: current_user.id, collection_id: params[:id]) != []
	  		@registrada = true
	  	else
	  		@registrada = false
	  	end
	end

  end
end
