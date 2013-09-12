class CreateEventsVolunteers < ActiveRecord::Migration
  def change
    create_table :events_volunteers do |t|
      t.integer :event_id
      t.integer :volunteer_id

      t.timestamps
    end
    add_index :events_volunteers, :event_id
    add_index :events_volunteers, :volunteer_id
    add_index :events_volunteers, [:event_id, :volunteer_id], unique: true
  end
end
