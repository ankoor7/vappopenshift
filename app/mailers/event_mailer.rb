class EventMailer < ActionMailer::Base
  default from: "from@example.com"

  def event_cancellation(event)
    event.volunteers.each do |user|
      @event = event
      @user = user
      mail(:to => user.email, :subject => "#{event.name} has been cancelled")
    end
  end

  def event_approaching(event, user)
    @event = event
    @user = user
    mail(:to => user.email, :subject => "#{event.name} is coming up!")
  end

end
