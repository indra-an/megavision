# == Schema Information
#
# Table name: movie_schedules
#
#  id                  :integer          not null, primary key
#  title               :string
#  logo                :string
#  schedule_attachment :string
#  created_at          :datetime         not null
#  updated_at          :datetime         not null
#

require 'test_helper'

class MovieScheduleTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
