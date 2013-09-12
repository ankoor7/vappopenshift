class AddCausesToGroup < ActiveRecord::Migration
  def change
    add_column :groups, :causes, :string
  end
end
