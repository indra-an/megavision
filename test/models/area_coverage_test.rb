# == Schema Information
#
# Table name: area_coverages
#
#  id              :integer          not null, primary key
#  channel_city_id :integer
#  area            :string
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  area_code_id    :integer
#  slug            :string
#

require 'test_helper'

class AreaCoverageTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
