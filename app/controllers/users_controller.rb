class UsersController < ApplicationController
  load_and_authorize_resource

  def dashboard
    @user_events = current_user.events.by_date.page(params[:user_events_page]).per(5)
    @groups = current_user.led_groups.includes(:events).page(params[:groups_page]).per(3)
  end

  def edit_profile
    @user = current_user
  end

  def update_profile
    @user = current_user
  end
end

