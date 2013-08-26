class CreateGroupsVolunteers < ActiveRecord::Migration
  def change
    create_table :groups_volunteers do |t|
      t.integer :group_id
      t.integer :volunteer_id

      t.timestamps
    end
    add_index :groups_volunteers, :group_id
    add_index :groups_volunteers, :volunteer_id
    add_index :groups_volunteers, [:group_id, :volunteer_id], unique: true
  end
end
