# == Schema Information
#
# Table name: channel_packages
#
#  id                     :integer          not null, primary key
#  channel_cities_type_id :integer
#  package_id             :integer
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#

class ChannelPackage < ApplicationRecord
  has_many :channel_package_channel_groups
  has_many :channel_groups, through: :channel_package_channel_groups

  has_many :channel_package_prices
  has_many :prices, through: :channel_package_prices

  belongs_to :channel_cities_type
  belongs_to :package
end
