class AdminsChannelCity < ApplicationRecord
  belongs_to :admin
  belongs_to :channel_city
end
