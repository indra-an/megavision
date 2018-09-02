# == Schema Information
#
# Table name: admin_logs
#
#  id         :integer          not null, primary key
#  admin_id   :integer
#  type       :string
#  data       :text
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class AdminLog < ApplicationRecord
  belongs_to :admin

  serialize :data
end
