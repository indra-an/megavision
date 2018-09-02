# == Schema Information
#
# Table name: admin_logs
#
#  id         :integer          not null, primary key
#  admin_id   :integer
#  type       :string
#  data       :text
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'test_helper'

class AdminLogTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
