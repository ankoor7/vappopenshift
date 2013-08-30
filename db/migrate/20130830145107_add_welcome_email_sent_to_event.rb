class AddWelcomeEmailSentToEvent < ActiveRecord::Migration
  def change
    add_column :events, :welcome_email_sent, :boolean, default: false
  end
end
