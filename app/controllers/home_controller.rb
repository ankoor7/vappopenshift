class HomeController < ApplicationController
  def index


    @groups = Group.page(params[:page]).per(3)

    if current_user
      @events = Event.available_events(current_user).by_date.page(params[:page]).per(10)
      @user_events = current_user.events.by_date.page(params[:page]).per(5)
    else
      @events = Event.by_date.page(params[:page]).per(10)
    end


  end
end
