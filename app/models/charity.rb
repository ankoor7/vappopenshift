class Charity < ActiveRecord::Base
  attr_accessible :description, :email, :location, :name, :phone, :website

  # ASSOCIATIONS
  has_many :users
  has_many :groups

  # VALIDATIONS
  validates :email, presence: true, uniqueness: true
  validates :description, presence: true
  validates :location, presence: true
  validates :name, presence: true, uniqueness: true
  validates :website, presence: true, uniqueness: true
  validates :phone, presence: true, uniqueness: true

end
