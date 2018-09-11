# == Schema Information
#
# Table name: movie_schedules
#
#  id                  :integer          not null, primary key
#  title               :string
#  logo                :string
#  schedule_attachment :string
#  created_at          :datetime         not null
#  updated_at          :datetime         not null
#

class MovieSchedule < ApplicationRecord
    mount_uploader :logo, ImageUploader
    mount_uploader :schedule_attachment, DocumentUploader

    validates_presence_of :title, :logo

end
