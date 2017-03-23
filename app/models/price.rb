class Price < ApplicationRecord
  validates_presence_of :amount, :up_to_speed, :unit
end
