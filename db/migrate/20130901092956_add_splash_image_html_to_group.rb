class AddSplashImageHtmlToGroup < ActiveRecord::Migration
  def change
    add_column :groups, :splash_image_html, :text
  end
end
