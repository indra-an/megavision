# == Schema Information
#
# Table name: prices
#
#  id          :integer          not null, primary key
#  amount      :decimal(, )
#  up_to_speed :integer
#  unit        :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Price < ApplicationRecord
  validates_presence_of :amount, :up_to_speed, :unit

  def tag_name
    [number_with_delimiter(amount), "up to", up_to_speed, unit].join(" ")
  end
end
