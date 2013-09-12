class AddSplashImageToGroup < ActiveRecord::Migration
  def change
    add_column :groups, :splash_image, :string
  end
end
