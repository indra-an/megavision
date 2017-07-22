# == Schema Information
#
# Table name: channel_groups
#
#  id         :integer          not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class ChannelGroup < ApplicationRecord
  has_and_belongs_to_many :channels
  has_many :channel_package_channel_groups, dependent: :destroy

  validates_presence_of :name

end
