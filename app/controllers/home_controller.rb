class HomeController < ApplicationController
  def index
    @events = Event.order('date').page(params[:page]).per(10)
    @groups = Group.page(params[:page]).per(3)
  end
end
