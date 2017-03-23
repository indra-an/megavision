class Channel < ApplicationRecord
  has_and_belongs_to_many :channel_cities

  validates_presence_of :name
end
