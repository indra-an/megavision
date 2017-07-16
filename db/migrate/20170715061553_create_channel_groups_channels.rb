class CreateChannelGroupsChannels < ActiveRecord::Migration[5.0]
  def change
    create_table :channel_groups_channels do |t|
      t.references :channel_group, foreign_key: true
      t.references :channel, foreign_key: true
    end
  end
end
