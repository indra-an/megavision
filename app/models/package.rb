# == Schema Information
#
# Table name: packages
#
#  id         :integer          not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Package < ApplicationRecord
  before_save :update_slug

  private
    def update_slug
      slug = self.name.truncate(48).parameterize
      self.slug = slug
    end
end
