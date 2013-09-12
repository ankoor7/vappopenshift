class AddLongitudeLatitudeToGroup < ActiveRecord::Migration
  def change
    add_column :groups, :longitude, :float
    add_column :groups, :latitude, :float
  end
end
