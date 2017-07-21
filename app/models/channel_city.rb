# == Schema Information
#
# Table name: channel_cities
#
#  id         :integer          not null, primary key
#  city       :string
#  slug       :string
#  panel_name :string
#  background :string
#

class ChannelCity < ApplicationRecord
  mount_uploader :background, ImageUploader

  has_many :channel_cities_types, dependent: :destroy
  has_many :channel_types, through: :channel_cities_types

  has_many :channel_packages, through: :channel_cities_types, dependent: :destroy
  has_many :packages, through: :channel_packages

  has_many :channel_package_channel_groups, through: :channel_packages, dependent: :destroy
  has_many :channel_groups, through: :channel_package_channel_groups

  has_many :channel_package_prices, through: :channel_packages, dependent: :destroy
  has_many :prices, through: :channel_package_prices

  has_and_belongs_to_many :channels

  validates_presence_of :city, :panel_name

  before_save :update_slug

  private

  def update_slug
    slug = self.city.truncate(48).parameterize
    self.slug = slug
  end
end
