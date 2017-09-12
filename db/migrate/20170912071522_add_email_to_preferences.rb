class AddEmailToPreferences < ActiveRecord::Migration[5.0]
  def change
    add_column :preferences, :subscribe_emails, :text
    add_column :preferences, :contact_emails, :text
  end
end
