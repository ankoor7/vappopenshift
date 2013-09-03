class AddCauseSearchHackToEvent < ActiveRecord::Migration
  def change
    add_column :events, :cause_search_hack, :string
  end
end
