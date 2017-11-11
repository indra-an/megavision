class CreateAdminsChannelCities < ActiveRecord::Migration[5.0]
  def change
    create_table :admins_channel_cities do |t|
      t.references :admin
      t.references :channel_city

      t.timestamps
    end
  end
end
