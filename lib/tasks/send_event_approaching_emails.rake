namespace :email do
  desc "This is to send an email to volunteers of upcoming events"
  task :send_event_approaching_emails => :environment  do
    @events = Event.approaching_events.approaching_events_email_not_sent
    @events.each do |event|
      event.volunteers.each do |volunteer|
        EventMailer.event_approaching(event,volunteer).deliver
      end
    end
  end
end