class ApplicationController < ActionController::Base
  protect_from_forgery

  rescue_from CanCan::AccessDenied do |exception|
    redirect_to root_url, :alert => exception.message
  end

  before_filter :setup_ransack_search


  def setup_ransack_search
    @q=Event.search(params[:q])
  end


end
