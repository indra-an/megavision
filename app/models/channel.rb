# == Schema Information
#
# Table name: channels
#
#  id   :integer          not null, primary key
#  name :string
#

class Channel < ApplicationRecord
  has_and_belongs_to_many :channel_cities
  has_and_belongs_to_many :channel_types
  has_and_belongs_to_many :channel_groups

  validates_presence_of :name
end
