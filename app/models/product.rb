# == Schema Information
#
# Table name: products
#
#  id          :integer          not null, primary key
#  title       :string
#  icon        :string
#  description :string
#  is_active   :boolean          default(TRUE)
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Product < ApplicationRecord
  mount_uploader :icon, ImageUploader

  validates_presence_of :title, :description, :icon

  scope :active, -> {
    where("is_active = ?", true)
  }
end
