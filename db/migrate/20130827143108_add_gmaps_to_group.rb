class AddGmapsToGroup < ActiveRecord::Migration
  def change
    add_column :groups, :gmaps, :boolean
  end
end
