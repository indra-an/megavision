class Vacancy < ApplicationRecord
  mount_uploader :icon, ImageUploader

  serialize :requirements, Array

  validates_presence_of :position, :icon, :location, :requirements
  validate :ensure_valid_requirements_content

  def update_slug
    slug = [self.position, self.location].join(' ').truncate(48).parameterize
    update(:slug => slug)
  end

  private

  def ensure_valid_requirements_content
    requirements.reject!(&:blank?)
    errors.add(:requirements, "can't be blank") if requirements.count == 0
  end
end
