class AreaCode < ApplicationRecord
  has_and_belongs_to_many :channel_types, dependent: :destroy
  has_many :area_coverages, dependent: :destroy

  validates :code, presence: true, uniqueness: true
end
