class Event < ActiveRecord::Base
  attr_accessible :date, :description, :location, :name, :number_volunteers, :special_instructions, :latitude, :longitude

  # ASSOCIATIONS
  has_many :events_volunteers, dependent: :destroy
  has_many :volunteers, through: :events_volunteers
  belongs_to :group

  # VALIDATIONS
  validates :date, presence: true
  validates :description, presence: true
  validates :location, presence: true
  validates :name, presence: true
  validates :number_volunteers, presence: true



end
