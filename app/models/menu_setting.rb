# == Schema Information
#
# Table name: menu_settings
#
#  id              :integer          not null, primary key
#  menu            :string
#  slug            :string
#  type            :string
#  is_active       :boolean          default(TRUE)
#  hidden_content  :boolean          default(FALSE)
#  disable_content :boolean          default(FALSE)
#  parent_id       :integer
#  position        :integer
#  link_type       :integer          default("scroll")
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#

class MenuSetting < ApplicationRecord
  validates_presence_of :menu, :position
  validates_uniqueness_of :position
  validates :position, numericality: { greater_than: 0 }

  enum link_type: [:scroll, :redirect]

  before_save :update_slug

  scope :active, -> {
    where("is_active = ?", true)
  }

  private

  def update_slug
    slug = self.menu.truncate(48).parameterize
    self.slug = slug
  end
end
