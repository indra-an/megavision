class CreateChannelPackages < ActiveRecord::Migration[5.0]
  def change
    create_table :channel_packages do |t|
      t.references :channel_cities_type, foreign_key: true
      t.references :package, foreign_key: true

      t.timestamps
    end
  end
end
