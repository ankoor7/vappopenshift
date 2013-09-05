class EventsVolunteersController < ApplicationController

  def register
    @event = Event.find(params[:id])
    @event.register(current_user)
    respond_to do |format|
      if @event.save
        format.html { redirect_to home_path, notice: 'Thanks for volunteering!' }
      else
        format.html { redirect_to @event, notice: 'Sorry, there was a problem with the system. Please try again later.' }
      end
    end
  end

  def unregister
    @event = Event.find(params[:id])
    @event.unregister(current_user)
    respond_to do |format|
      if @event.save
        format.html { redirect_to home_path, notice: 'You have been unregistered!' }
      else
        format.html { redirect_to @event, notice: 'Sorry, there was a problem with the system. Please try again later.' }
      end
    end
  end

end
