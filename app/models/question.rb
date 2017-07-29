# == Schema Information
#
# Table name: questions
#
#  id         :integer          not null, primary key
#  question   :text
#  answer     :text
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Question < ApplicationRecord
  mount_uploader :attachment, DocumentUploader

  validates_presence_of :question, :answer
end
