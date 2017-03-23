class AddSlugToChannelCities < ActiveRecord::Migration[5.0]
  def change
    add_column :channel_cities, :slug, :string
    add_index :channel_cities, :slug
  end
end
