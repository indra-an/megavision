class CreateChannelPackageChannelPrices < ActiveRecord::Migration[5.0]
  def change
    create_table :channel_package_prices do |t|
      t.references :channel_package, foreign_key: true
      t.references :price, foreign_key: true

      t.timestamps
    end
  end
end
