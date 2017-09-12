class AddCheckAreaTitleToPreferences < ActiveRecord::Migration[5.0]
  def change
    add_column :preferences, :check_area, :string
  end
end
