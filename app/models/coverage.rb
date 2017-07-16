# == Schema Information
#
# Table name: coverages
#
#  id          :integer          not null, primary key
#  name        :string
#  coordinates :text
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Coverage < ApplicationRecord
  serialize :coordinates, Array
end
