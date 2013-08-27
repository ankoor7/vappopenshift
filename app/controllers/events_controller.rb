class EventsController < ApplicationController

  def index
    @events = Events.all
  end

  def show
    @event = Event.find(params[:id])
    @eventmap = Event.find(params[:id]).to_gmaps4rails
  end

  def edit
    @event = Event.find(params[:id])
  end

  def update
    @event = Event.find(params[:id])

    respond_to do |format|
      if @cheer_up.update_attributes(params[:cheer_up])
        format.html { redirect_to @cheer_up, notice: 'Cheer up was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @cheer_up.errors, status: :unprocessable_entity }
      end
    end
  end

  def new
    @event = Event.new
  end

  def create
    @event = Event.new(params[:event])
    respond_to do |format|
      if @event.save
        format.html { redirect_to home_path, notice: 'Your event is ready for volunteers.' }
        format.json { render json: @event, status: :created, location: @event }
      else
        format.html { render action: "new" }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end
  end
end
