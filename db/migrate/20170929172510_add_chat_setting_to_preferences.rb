class AddChatSettingToPreferences < ActiveRecord::Migration[5.0]
  def change
    add_column :preferences, :chat_title, :string
    add_column :preferences, :chat_status, :boolean
    add_column :preferences, :chat_off_message, :string
  end
end
