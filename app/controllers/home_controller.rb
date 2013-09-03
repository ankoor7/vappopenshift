class HomeController < ApplicationController
  # load_and_authorize_resource

  def index
    # @search_events = @q.result(:distinct => true)
    @groups = Group.page(params[:groups_page]).per(2)
    if current_user && current_user.attending_events?
      @events = Event.available_events(current_user).by_date.page(params[:events_page]).per(8)
      @user_events = current_user.events.by_date.page(params[:user_events_page]).per(4)
    else
      @events = Event.by_date.page(params[:events_page]).per(8)
    end
  end

  def search
    @search_events = @q.result(distinct: true).page(params[:events_page]).per(8)
  end

end
