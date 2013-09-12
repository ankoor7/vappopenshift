class AddSloganToGroup < ActiveRecord::Migration
  def change
    add_column :groups, :slogan, :string
  end
end
