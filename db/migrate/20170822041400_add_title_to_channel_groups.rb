class AddTitleToChannelGroups < ActiveRecord::Migration[5.0]
  def change
    add_column :channel_groups, :title, :string
  end
end
