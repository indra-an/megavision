class CreateChannelGroups < ActiveRecord::Migration[5.0]
  def change
    create_table :channel_groups do |t|
      t.string :name

      t.timestamps
    end
  end
end
