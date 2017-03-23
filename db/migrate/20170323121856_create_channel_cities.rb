class CreateChannelCities < ActiveRecord::Migration[5.0]
  def change
    create_table :channel_cities do |t|
      t.string :city
    end
  end
end
