# == Schema Information
#
# Table name: preferences
#
#  id                         :integer          not null, primary key
#  about_megavision           :text
#  about_starnet              :text
#  company_history            :text
#  company_vision_missions    :text
#  addresses                  :text
#  copyright_text             :string
#  linked_in_url              :string
#  facebook_url               :string
#  twitter_url                :string
#  background_area_channel    :string
#  background_question_answer :string
#  background_history         :string
#  background_vision_mission  :string
#  background_vacancy         :string
#  background_contact         :string
#  check_area                 :string
#  subscribe_emails           :text
#  contact_emails             :text
#  chat_title                 :string
#  chat_status                :boolean
#  chat_off_message           :string
#  disclaimer_title           :string
#  disclaimer_content         :text
#

require 'test_helper'

class PreferenceTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
