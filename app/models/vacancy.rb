# == Schema Information
#
# Table name: vacancies
#
#  id           :integer          not null, primary key
#  position     :string
#  icon         :string
#  location     :string
#  requirements :text
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  slug         :string
#

class Vacancy < ApplicationRecord
  mount_uploader :icon, ImageUploader

  serialize :requirements, Array

  validates_presence_of :position, :icon, :location, :requirements
  validate :ensure_valid_requirements_content

  before_save :update_slug

  private

  def update_slug
    slug = [self.position, self.location].join(' ').truncate(48).parameterize
    self.slug = slug
  end

  def ensure_valid_requirements_content
    requirements.reject!(&:blank?)
    errors.add(:requirements, "can't be blank") if requirements.count == 0
  end
end
