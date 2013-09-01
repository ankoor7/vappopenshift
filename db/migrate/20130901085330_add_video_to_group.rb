class AddVideoToGroup < ActiveRecord::Migration
  def change
    add_column :groups, :video, :string
  end
end
