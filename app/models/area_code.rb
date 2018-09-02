# == Schema Information
#
# Table name: area_codes
#
#  id         :integer          not null, primary key
#  code       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class AreaCode < ApplicationRecord
  has_and_belongs_to_many :channel_types, dependent: :destroy
  has_many :area_coverages, dependent: :destroy

  validates :code, presence: true, uniqueness: true
end
