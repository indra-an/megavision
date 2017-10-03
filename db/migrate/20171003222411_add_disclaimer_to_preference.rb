class AddDisclaimerToPreference < ActiveRecord::Migration[5.0]
  def change
    add_column :preferences, :disclaimer_title, :string
    add_column :preferences, :disclaimer_content, :text
  end
end
