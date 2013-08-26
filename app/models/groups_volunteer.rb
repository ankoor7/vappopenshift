class GroupsVolunteer < ActiveRecord::Base
  attr_accessible :group_id, :volunteer_id
  belongs_to :group
  belongs_to :volunteer, class_name: "User"
end
