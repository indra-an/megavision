class CreateChannelPackageChannelGroups < ActiveRecord::Migration[5.0]
  def change
    create_table :channel_package_channel_groups do |t|
      t.references :channel_package, foreign_key: true
      t.references :channel_group, foreign_key: true

      t.timestamps
    end
  end
end
