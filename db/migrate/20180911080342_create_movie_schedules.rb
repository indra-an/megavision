class CreateMovieSchedules < ActiveRecord::Migration[5.0]
  def change
    create_table :movie_schedules do |t|
      t.string :title
      t.string :logo
      t.string :schedule_attachment

      t.timestamps
    end
  end
end
