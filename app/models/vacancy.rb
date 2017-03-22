class Vacancy < ApplicationRecord
  mount_uploader :icon, ImageUploader

  # serialize :requirements, Array
end
