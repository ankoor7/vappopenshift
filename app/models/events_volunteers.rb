class EventsUsers < ActiveRecord::Base
  belongs_to :event
  belongs_to :volunteer, class_name: "User"
end
