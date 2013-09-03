class AddCauseSearchHackToGroup < ActiveRecord::Migration
  def change
    add_column :groups, :cause_search_hack, :string
  end
end
