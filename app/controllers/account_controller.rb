class AccountController < ApplicationController
  before_action :set_account, only: [:edit, :profile]

  def profile
    @services = @user.services
    @statusverify = @user.verify_user
  end

  def edit
    resource = @user
  end

  def update
  end
  
  def verify
  end

  def update_verify
  end

  def setting

  end

  private
    def set_account
      @user = User.find(params[:id])
    end
end