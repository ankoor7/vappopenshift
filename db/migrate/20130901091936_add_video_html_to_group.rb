class AddVideoHtmlToGroup < ActiveRecord::Migration
  def change
    add_column :groups, :video_html, :string
  end
end
