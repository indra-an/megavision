class DeviseAddLastseenableAdmin < ActiveRecord::Migration
  def self.up
    add_column :admins, :last_seen, :datetime
  end
  
  def self.down
    remove_column :admins, :last_seen
  end
end