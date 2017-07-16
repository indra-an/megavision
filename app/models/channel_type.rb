# == Schema Information
#
# Table name: channel_types
#
#  id         :integer          not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class ChannelType < ApplicationRecord
   has_many :channel_cities_types
   has_many :channel_cities, through: :channel_cities_types
   has_many :channel_packages, through: :channel_cities_types

   validates_presence_of :name
end
