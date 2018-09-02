# == Schema Information
#
# Table name: menu_settings
#
#  id              :integer          not null, primary key
#  menu            :string
#  slug            :string
#  type            :string
#  is_active       :boolean          default(TRUE)
#  hidden_content  :boolean          default(FALSE)
#  disable_content :boolean          default(FALSE)
#  parent_id       :integer
#  position        :integer
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#

require 'test_helper'

class MenuSettingTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
