class CreateGroups < ActiveRecord::Migration
  def change
    create_table :groups do |t|
      t.references :charity
      t.string :name
      t.string :location
      t.string :email
      t.string :phone
      t.string :website
      t.references :groups_leaders
      t.references :groups_volunteers

      t.timestamps
    end
    add_index :groups, :charity_id
  end
end
