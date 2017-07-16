# == Schema Information
#
# Table name: channel_package_channel_groups
#
#  id                 :integer          not null, primary key
#  channel_package_id :integer
#  channel_group_id   :integer
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#

require 'test_helper'

class ChannelPackageChannelGroupTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
