class Group < ActiveRecord::Base
  belongs_to :charity
  has_many :events
  has_many :groups_leaders, dependent: :destroy
  has_many :groups_volunteers, dependent: :destroy
  has_many :leaders, through: :groups_leaders, foreign_key: :leader_id
  has_many :volunteers, through: :groups_volunteers, foreign_key: :volunteer_id

  attr_accessible :email, :location, :name, :phone, :website
end
