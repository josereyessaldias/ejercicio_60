class PagesController < ApplicationController
  authorize_resource :class => PagesController
  
  def index

    @collections = []
    if user_signed_in?
      UserCollection.eager_load(:collection).where(user_id: current_user.id).each do |collect|
        @collections << collect.collection
      end
    end

    if params[:q].present?
      @entities = Activity.where('name like ?', "%#{params[:q]}%") + Collection.where('name like ?', "%#{params[:q]}%")
    else
      @entities = []
    end

    @users = User.all
    
    if user_signed_in?
      @contacts = User.find(current_user.id).contacting
    end


    @promotes = Activity.eager_load(:category).sample(2)
    PromoteActivity.eager_load(activity: :category).where(payed: true).each do |promote|
      @promotes << promote.activity
    end
    
  
    

    @sucesos = []
    if user_signed_in?

      @contacts.each do |c|
        User.eager_load(user_activity: :actuser_photo).eager_load(user_activity: {activity: :category}).find(c.followed_id).user_activity.each do |suc|
          @sucesos << suc
        end
      end
      User.eager_load(user_activity: :actuser_photo).eager_load(user_activity: {activity: :category}).find(current_user.id).user_activity.each do |suceso|
      
         @sucesos << suceso
      end
      @sucesos.sort_by {|event| event.created_at}
      @sucesos.reverse!
    end

  end  

  
  def user_calendar
    @user = User.find(params[:user_id])
    @act_user_por_realizar = UserActivity.where(user_id: params[:user_id], status: 'por_hacer')
  end


  def politica
  end


  def configuration
    @user = User.find(current_user.id)
  end



end
