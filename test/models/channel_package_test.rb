# == Schema Information
#
# Table name: channel_packages
#
#  id                     :integer          not null, primary key
#  channel_cities_type_id :integer
#  package_id             :integer
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  description            :text
#

require 'test_helper'

class ChannelPackageTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
