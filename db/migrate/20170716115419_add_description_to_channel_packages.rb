class AddDescriptionToChannelPackages < ActiveRecord::Migration[5.0]
  def change
    add_column :channel_packages, :description, :text
  end
end
