class Preference < ApplicationRecord
  serialize :addresses, Array
  serialize :company_vision_missions, Array

  validates_format_of :facebook_url, :twitter_url, :linked_in_url,
                      :with => URI::regexp, :allow_blank => true

  def self.fetch
    first
  end
end
