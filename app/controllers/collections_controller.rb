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


  def new
  	@collection = Collection.new
  end

  def create
  	@collection = Collection.new
  	@collection.name = params[:collection][:name]
  	@collection.photo = params[:collection][:photo]
  	@collection.remote_photo_url = params[:collection][:remote_photo_url]
  	@collection.owner_id = current_user.id
  	@collection.save
  	redirect_to edit_collection_path(@collection), notice: 'collection fue creada'
  end

  def edit
  	@collection = Collection.find(params[:id])
    @col_activities = ActivityCollection.eager_load(:activity).where(collection_id: params[:id])
  end

  def update
  	@collection = Collection.find(params[:id])
  	@collection.update(name: params[:collection][:name])
  	@collection.update(photo: params[:collection][:photo])
  	@collection.update(remote_photo_url: params[:collection][:remote_photo_url])
  	redirect_to user_path(current_user), notice: 'collection fue editada'
  end

  def destroy
  end

end
