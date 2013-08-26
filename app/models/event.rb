class Event < ActiveRecord::Base
  attr_accessible :date, :description, :location, :name, :number_volunteers, :special_instructions, :latitude, :longitude

  # ASSOCIATIONS
  has_many :events_volunteers, dependent: :destroy
  has_many :volunteers, through: :events_volunteers, source: :event_id

  # has_and_belongs_to_many :volunteers, :join_table => "events_volunteers", :foreign_key => :event_id, :association_foreign_key => :volunteer_id

  belongs_to :group

  # VALIDATIONS
  validates :date, presence: true
  validates :description, presence: true
  validates :location, presence: true
  validates :name, presence: true
  validates :number_volunteers, presence: true



end
