class ActivitiesController < ApplicationController
  def index
    @activities = PublicActivity::Activity.where(recipient_id: current_user.id).order(:created_at)
    Activity.mark_as_read! :all, :for => current_user if Activity.where(recipient_id: current_user.id).unread_by(current_user).count != 0
  end

  def destroy
    @notify = PublicActivity::Activity.find(params[:id])
    @notify.destroy
    redirect_to notifications_url
  end
end
