class HomeController < ApplicationController
  # load_and_authorize_resource

  def index
    @search_events = @q.result(distinct: true)
    # @search_events = @q.result(:distinct => true)
    @groups = Group.page(params[:groups_page]).per(3)
    if current_user && current_user.attending_events?
      @events = Event.available_events(current_user).by_date.page(params[:events_page]).per(10)
      @user_events = current_user.events.by_date.page(params[:user_events_page]).per(5)
    end
      @events = Event.by_date.page(params[:events_page]).per(8)
      @user_events = Event.by_date.page(params[:events_page]).per(10)
  end

  def search
    index
    render :index
  end

end
