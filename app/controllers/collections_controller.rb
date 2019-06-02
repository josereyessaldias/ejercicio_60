class CollectionsController < ApplicationController


  
  def show
  	@collection = Collection.find(params[:id])
    authorize! :show, @collection

  	if user_signed_in?
      
      @contacts = User.find(current_user.id).contacting
      @contacts_collection = []
      @collection.users.each do |user|
        @contacts.each do |contact|
          if user.id == contact.followed_id
            @contacts_collection << User.find(contact.followed_id)
          end
        end
      end

	  	if UserCollection.where(user_id: current_user.id, collection_id: params[:id]) != []
	  		@registrada = true
	  	else
	  		@registrada = false
	  	end
	  end

    

  end


  def new
  	@collection = Collection.new
    authorize! :new, @collection
  end

  def create
  	@collection = Collection.new
  	@collection.name = params[:collection][:name]
  	@collection.photo = params[:collection][:photo]
  	@collection.remote_photo_url = params[:collection][:remote_photo_url]
  	@collection.owner_id = current_user.id
    authorize! :create, @collection
  	@collection.save
  	redirect_to edit_collection_path(@collection), notice: 'collection fue creada'
  end

  def edit
  	@collection = Collection.find(params[:id])
    authorize! :edit, @collection
    @col_activities = ActivityCollection.eager_load(:activity).where(collection_id: params[:id])
    @activities = Activity.all
  end

  def update
  	@collection = Collection.find(params[:id])
    authorize! :update, @collection
  	@collection.update(name: params[:collection][:name])
  	@collection.update(photo: params[:collection][:photo])
  	@collection.update(remote_photo_url: params[:collection][:remote_photo_url])
  	redirect_to collection_path(@collection), notice: 'collection fue editada'
  end

  def destroy
    @collection = Collection.find(params[:id])
    authorize! :destroy, @collection
    @collection.destroy
    redirect_to pages_configuration_path, notice: 'la colección fue borrada'
  end

end
