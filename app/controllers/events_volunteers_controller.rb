class EventsVolunteersController < ApplicationController

  def register
    @event = Event.find(params[:id])
    @event.register(current_user)
    respond_to do |format|
      if @event.save
        format.html { redirect_to @event, notice: 'Thanks for volunteering!' }
        format.json { render json: @event, status: :updated, location: @event }
      else
        format.html { redirect_to @event, notice: 'Sorry, there was a problem with the system. Please try again later.' }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end
  end

  def unregister
    @event = Event.find(params[:id])
    @event.unregister(current_user)
    respond_to do |format|
      if @event.save
        format.html { redirect_to @event, notice: 'You have been unregistered!' }
        format.json { render json: @event, status: :updated, location: @event }
      else
        format.html { redirect_to @event, notice: 'Sorry, there was a problem with the system. Please try again later.' }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end
  end

end
