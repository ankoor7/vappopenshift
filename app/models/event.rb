class Event < ActiveRecord::Base
  attr_accessible :date, :description, :location, :name, :number_volunteers, :special_instructions, :latitude, :longitude



  # ASSOCIATIONS
  has_many :events_volunteers, dependent: :destroy
  has_many :volunteers, through: :events_volunteers
  belongs_to :group

  # GEOCODER SETTINGS
  geocoded_by :location
  after_validation :geocode

  # gmaps4rails setting
  acts_as_gmappable

  # VALIDATIONS
  validates :date, presence: true
  validates :description, presence: true
  validates :location, presence: true
  validates :name, presence: true
  validates :number_volunteers, presence: true


scope :by_date, -> { order('date') }
scope :available_events, lambda { |user|where("id NOT IN (?)", user.event_ids) }


  def unregister(user)
    volunteers.delete(user) if volunteer_ids.include? user.id
  end

  def gmaps4rails_address
    "#{self.location}"
  end

end
