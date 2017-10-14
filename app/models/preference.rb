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
#

class Preference < ApplicationRecord
  mount_uploader :background_area_channel, ImageUploader
  mount_uploader :background_question_answer, ImageUploader
  mount_uploader :background_history, ImageUploader
  mount_uploader :background_vision_mission, ImageUploader
  mount_uploader :background_vacancy, ImageUploader
  mount_uploader :background_contact, ImageUploader

  serialize :addresses, Array
  serialize :company_vision_missions, Array
  serialize :subscribe_emails, Array
  serialize :contact_emails, Array

  validates_format_of :facebook_url, :twitter_url, :linked_in_url,
                      :with => URI::regexp, :allow_blank => true

  def self.fetch
    first
  end
end
