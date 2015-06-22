class ActivitiesController < ApplicationController
  def index
    @activities = PublicActivity::Activity.where(recipient_id: current_user.id).order(:created_at)
    Activity.mark_as_read! :all, :for => current_user if Activity.all.count != nil
  end

  def destroy
    @notify = PublicActivity::Activity.find(params[:id])
    @notify.destroy
    redirect_to notifications_url
  end
end
