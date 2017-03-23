class ChannelCity < ApplicationRecord
  has_and_belongs_to_many :channels

  validates_presence_of :city

  before_save :update_slug

  private

  def update_slug
    slug = self.city.truncate(48).parameterize
    self.slug = slug
  end
end
