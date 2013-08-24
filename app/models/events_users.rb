class EventsUsers < ActiveRecord::Base
  belongs_to :event
  belongs_to :user
  # attr_accessible :title, :body
end
