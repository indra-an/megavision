# == Schema Information
#
# Table name: channel_cities_types
#
#  id              :integer          not null, primary key
#  channel_city_id :integer
#  channel_type_id :integer
#

class ChannelCitiesType < ApplicationRecord
  has_many :channel_packages

  belongs_to :channel_type
  belongs_to :channel_city
end
