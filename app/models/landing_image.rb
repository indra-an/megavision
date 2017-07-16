# == Schema Information
#
# Table name: landing_images
#
#  id          :integer          not null, primary key
#  title       :string
#  subtitle    :text
#  background  :string
#  addon_image :string
#  status      :integer          default("draft")
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class LandingImage < ApplicationRecord
  mount_uploader :addon_image, ImageUploader
  mount_uploader :background, ImageUploader

  enum :status => [:draft, :published]

  HUMANIZED_ATTRIBUTES = {
    addon_image: "Desktop Image",
    background: "Mobile Image"
  }

  class << self
    def human_attribute_name(attr, options = {})
      HUMANIZED_ATTRIBUTES[attr.to_sym] || super
    end
  end

end
