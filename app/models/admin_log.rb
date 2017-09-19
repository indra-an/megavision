class AdminLog < ApplicationRecord
  belongs_to :admin

  serialize :data
end
