class UsersController < ApplicationController
  def dashboard
    @groups = current_user.led_groups.includes(:events).page(params[:groups_page]).per(3)
  end
end

