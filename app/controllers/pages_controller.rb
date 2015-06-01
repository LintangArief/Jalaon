class PagesController < ApplicationController
  before_action :set_user, only: [:profile]
  def list_user
    @users = User.order(:first_name).page params[:page]
  end
  
  def search_user
    if params[:search].present?
      @users = User.where(first_name: params[:search]).order(:first_name).page params[:page]
    else
      @users = User.order(:first_name).page params[:page]
    end
  end
  
  def dasboard

  end
  
  def profile; end

  def add_friend
    request_friend = current_user.invite @user
    if @store.save
      format.html { redirect_to profile_path(@user.first_name, @user.id), notice: 'Request friend was successfully.' }
    else
      format.html { redirect_to profile_path(@user.first_name, @user.id), notice: 'Request friend was unsuccessfully.'  }
    end
  end

  def un_friend
    request_friend = current_user.remove_friendship @user
    if @store.save
      format.html { redirect_to profile_path(@user.first_name, @user.id), notice: 'Remove friend was successfully.' }
    else
      format.html { redirect_to profile_path(@user.first_name, @user.id), notice: 'Remove friend was unsuccessfully.'  }
    end
  end

  private
  def set_user
    @user = User.find_by(first_name: params[:name], id: params[:id])
  end
end