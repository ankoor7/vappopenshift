class HomeController < ApplicationController
  def index
    @events = Event.order('date').page(params[:page]).per(10)
    @groups = Group.page(params[:page]).per(3)

    if current_user
      @user_events = current_user.events.order('date').page(params[:page]).per(5)
    end


  end
end
