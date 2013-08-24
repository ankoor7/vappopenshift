class Event < ActiveRecord::Base
  attr_accessible :date, :description, :location, :name, :number_volunteers, :special_instructions

  has_and_belongs_to_many :users
  belongs_to :charity

end
