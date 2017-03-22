class CreateVacancies < ActiveRecord::Migration[5.0]
  def change
    create_table :vacancies do |t|
      t.string :position
      t.string :icon
      t.string :location
      t.text :requirements

      t.timestamps
    end
  end
end
