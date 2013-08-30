class Event < ActiveRecord::Base
  attr_accessible :date, :description, :location, :name, :number_volunteers, :special_instructions, :latitude, :longitude, :causes, :cause_list, :image



  # ASSOCIATIONS
  has_many :events_volunteers  # Moved the dependency removal to the Event Observer - before_destroy callback ", dependent: :destroy"
  has_many :volunteers, through: :events_volunteers
  belongs_to :group

  # CAUSES USING ACTS-AS-TAGGABLE-ON GEM
  acts_as_taggable_on :causes

  # GEOCODER SETTINGS
  geocoded_by :location
  after_validation :geocode

  # gmaps4rails setting
  acts_as_gmappable

  # Image uploader
  mount_uploader :image, ImageUploader

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

  def space_available?
    volunteers.count < number_volunteers
  end

end
