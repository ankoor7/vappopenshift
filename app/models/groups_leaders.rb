class GroupsLeaders < ActiveRecord::Base
  attr_accessible :group_id, :leader_id
  belongs_to :group
  belongs_to :leader, class_name: "User"
end
