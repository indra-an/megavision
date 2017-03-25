class Preference < ApplicationRecord
  mount_uploader :background_area_channel, ImageUploader
  mount_uploader :background_question_answer, ImageUploader
  mount_uploader :background_history, ImageUploader
  mount_uploader :background_vision_mission, ImageUploader
  mount_uploader :background_vacancy, ImageUploader
  mount_uploader :background_contact, ImageUploader

  serialize :addresses, Array
  serialize :company_vision_missions, Array

  validates_format_of :facebook_url, :twitter_url, :linked_in_url,
                      :with => URI::regexp, :allow_blank => true

  def self.fetch
    first
  end
end
