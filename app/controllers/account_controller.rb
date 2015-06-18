class AccountController < ApplicationController
  before_action :set_account, only: [:edit, :profile]
  before_action :set_verify, only: [:verify]

  def profile
    @services = @user.services
    @statusverify = @user.verify_user
  end

  def edit
  end

  def update

  end
  
  def verify
    
  end

  def update_verify
    respond_to do |format|
      if current_user.verify_user.update(params_verify)
        format.html { redirect_to edit_verify_account_path(params[:id]), notice: 'Request Verify was successfully Send.' }
      else
        format.html { redirect_to edit_verify_account_path(params[:id]), notice: 'Request Verify was Unsuccessfully Send.' }
      end
    end
  end

  def setting

  end

  def send_message
    @user = User.find(params[:message][:owner_id])
    current_user.send_message(@user, params[:message][:body], params[:message][:subject])
    if params[:message][:type] == "show_service"
      redirect_to service_path(params[:message][:service_id])
    end
  end

  def message
    @inbox = current_user.mailbox.inbox
    @send_box = current_user.mailbox.sentbox
    @trash = current_user.mailbox.trash
  end

  def sendbox
    @send_box = current_user.mailbox.sentbox
  end

  def trash
    
  end

  def replay
  
  end

  def delete_message

  end

  private
    def set_account
      @user = User.find(params[:id])
    end

    def set_verify
      @verify = current_user.verify_user
    end
    
    def params_verify
      params.require(:verify).permit(:id, :foto_ktp)
    end
end