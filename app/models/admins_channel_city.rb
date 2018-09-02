# == Schema Information
#
# Table name: admins_channel_cities
#
#  id              :integer          not null, primary key
#  admin_id        :integer
#  channel_city_id :integer
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#

class AdminsChannelCity < ApplicationRecord
  belongs_to :admin
  belongs_to :channel_city
end
