class ChannelCity < ApplicationRecord
  has_and_belongs_to_many :channels

  validates_presence_of :city
end
