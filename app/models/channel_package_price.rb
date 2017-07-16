# == Schema Information
#
# Table name: channel_package_prices
#
#  id                 :integer          not null, primary key
#  channel_package_id :integer
#  price_id           :integer
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#

class ChannelPackagePrice < ApplicationRecord
  belongs_to :channel_package
  belongs_to :price
end
