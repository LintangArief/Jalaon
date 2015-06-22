class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  before_filter :unread_notify
  before_filter :unread_message
  protect_from_forgery with: :exception

  def unread_message
    if current_user
      @unread_message_count = current_user.mailbox.receipts.where(is_read:false).count
    end
  end

  def unread_notify
    if current_user
      @count_notification_unread = Activity.where(recipient_id: current_user.id).unread_by(current_user).count
    end
  end

end