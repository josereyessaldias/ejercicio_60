class PromoteActivitiesController < ApplicationController
  
  def index
  	@user = User.find(current_user.id)
  	@promotes = PromoteActivity.where(user_id: current_user.id)
    authorize! :index, @user
  end

  def new
    @activities = Activity.where(owner_id: current_user.id)
  	@promote_activity = PromoteActivity.new
    authorize! :new, @promote_activity
  end

  def create
    @promote_activity = PromoteActivity.new
    authorize! :create, @promote_activity
    @promote_activity.user_id = current_user.id
    @promote_activity.activity_id = params[:promote_activity][:activity_id]
    @promote_activity.amount = params[:promote_activity][:amount]
    @promote_activity.save
    redirect_to promote_activities_path
  end

  def destroy
    @promote_activity = PromoteActivity.find(params[:id])
    authorize! :destroy, @promote_activity
    @promote_activity.destroy
    redirect_to promote_activities_path, notice: 'La promoción fue eliminada'
  end

end
