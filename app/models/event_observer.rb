class EventObserver < ActiveRecord::Observer

  def before_destroy(model)
    EventMailer.event_cancellation(model).deliver

    EventsVolunteer.where(event_id: model.id).each do |events_volunteer|
      events_volunteer.destroy
    end
  end

end
