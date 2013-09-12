class CreateGroupsLeaders < ActiveRecord::Migration
  def change
    create_table :groups_leaders do |t|
      t.integer :group_id
      t.integer :leader_id

      t.timestamps
    end
    add_index :groups_leaders, :group_id
    add_index :groups_leaders, :leader_id
    add_index :groups_leaders, [:group_id, :leader_id], unique: true

  end
end
