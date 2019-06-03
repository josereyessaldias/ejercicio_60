class UserController < ApplicationController
  authorize_resource :class => UserController

  def show
  	@user = User.find(params[:id])


    #if user_signed_in?
      @user_act_done = UserActivity.realizadas.eager_load(activity: :category).where(user_id: params[:id]).order(:created_at).reverse
      @titulo_done = "Actividades Realizadas"  if @user_act_done != []
      @user_act_wish = UserActivity.por_realizar.eager_load(activity: :category).where(user_id: params[:id]).order(:created_at).reverse
      @titulo_wish = "Actividades Por Realizar"  if @user_act_wish != []

      @cats_user_done = []
      @user_act_done.each do |act|
        if @cats_user_done.include? act.activity.category
        else
          @cats_user_done << act.activity.category
        end
      end

      @cats_user_wish = []
      @user_act_wish.each do |act|
        if @cats_user_wish.include? act.activity.category
        else
          @cats_user_wish << act.activity.category
        end
      end

      @user_collections = UserCollection.eager_load(:collection).where(user_id: params[:id]).order(:created_at).reverse
    #end

    @my_activities = UserActivity.where(user_id: @user.id, status: "realizada")

    if user_signed_in?
      if current_user.contacting.find_by(followed_id: @user.id) != nil
        @following = true
      else
        @following = false
      end
    end

    @trek = UserActivity.eager_load(activity: :category).where(user_id: params[:id])
    @trekking = []
    @trek.each do |i|
      if i.activity.category.id == 3
        @trekking << i
      end
    end

    @hash = Gmaps4rails.build_markers(@trekking) do |trek, marker|
      marker.lat trek.activity.latitude
      marker.lng trek.activity.longitude
      marker.infowindow trek.activity.name
    end
  end


  def user_calendar
    @user = User.find(params[:id])
    @act_user_por_realizar = UserActivity.where(user_id: params[:id], status: 'por_hacer')
  end

  def update_calendar
    @user_activity = UserActivity.find(params[:activity_id])
    authorize! :update_calendar, @user_activity
    @user_activity.update(start: params[:user_activity][:start])
  end
end
