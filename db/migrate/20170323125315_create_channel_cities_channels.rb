class CreateChannelCitiesChannels < ActiveRecord::Migration[5.0]
  def change
    create_table :channel_cities_channels do |t|
      t.references :channel_city, foreign_key: true
      t.references :channel, foreign_key: true
    end
  end
end
