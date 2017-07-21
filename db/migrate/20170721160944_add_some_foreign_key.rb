class AddSomeForeignKey < ActiveRecord::Migration[5.0]
  def change
    # remove the old foreign_key
    remove_foreign_key :channel_cities_types, :channel_types
    remove_foreign_key :channel_cities_types, :channel_cities
    remove_foreign_key :channel_packages, :channel_cities_types
    remove_foreign_key :channel_package_channel_groups, :channel_packages
    remove_foreign_key :channel_package_prices, :channel_packages


    # add the new foreign_key
    add_foreign_key :channel_cities_types, :channel_types, on_delete: :cascade
    add_foreign_key :channel_cities_types, :channel_cities, on_delete: :cascade
    add_foreign_key :channel_packages, :channel_cities_types, on_delete: :cascade
    add_foreign_key :channel_package_channel_groups, :channel_packages, on_delete: :cascade
    add_foreign_key :channel_package_prices, :channel_packages, on_delete: :cascade

  end
end
