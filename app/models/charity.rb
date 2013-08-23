class Charity < ActiveRecord::Base
  attr_accessible :description, :email, :location, :name, :phone, :website
end
