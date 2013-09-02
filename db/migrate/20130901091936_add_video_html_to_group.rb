class AddVideoHtmlToGroup < ActiveRecord::Migration
  def change
    add_column :groups, :video_html, :text
  end
end
