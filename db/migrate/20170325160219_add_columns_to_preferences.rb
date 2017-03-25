class AddColumnsToPreferences < ActiveRecord::Migration[5.0]
  def change
    add_column :preferences, :background_area_channel, :string
    add_column :preferences, :background_question_answer, :string
    add_column :preferences, :background_history, :string
    add_column :preferences, :background_vision_mission, :string
    add_column :preferences, :background_vacancy, :string
    add_column :preferences, :background_contact, :string
  end
end
