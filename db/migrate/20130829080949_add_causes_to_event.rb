class AddCausesToEvent < ActiveRecord::Migration
  def change
    add_column :events, :causes, :string
  end
end
