class CreateAreaCoverages < ActiveRecord::Migration[5.0]
  def change
    create_table :area_coverages do |t|
      t.references :channel_city
      t.string :area

      t.timestamps
    end
  end
end
