class CreateChannelCitiesTypes < ActiveRecord::Migration[5.0]
  def change
    create_table :channel_cities_types do |t|
      t.references :channel_city, foreign_key: true
      t.references :channel_type, foreign_key: true
    end
  end
end
