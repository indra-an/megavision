class LandingImage < ApplicationRecord
  mount_uploader :addon_image, ImageUploader
  mount_uploader :background, ImageUploader

  enum :status => [:draft, :published]
end
