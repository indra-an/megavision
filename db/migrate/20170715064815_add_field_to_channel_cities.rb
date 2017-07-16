class AddFieldToChannelCities < ActiveRecord::Migration[5.0]
  def change
    add_column :channel_cities, :panel_name, :string
    add_column :channel_cities, :background, :string
  end
end
