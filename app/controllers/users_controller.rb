class UsersController < ApplicationController
  def dashboard
    @groups = current_user.led_groups.includes(:events).page(params[:groups_page]).per(3)
  end

  def edit_profile
    @user = current_user
  end

  def update_profile
    @user = current_user
  end
end

