class Contact < ApplicationRecord
  validates_presence_of :name, :email, :subject, :message

  after_create :send_contact_notification

  private

  def send_contact_notification
    ApplicationMailer.send_contact_notification(self).deliver_now
  end
end
