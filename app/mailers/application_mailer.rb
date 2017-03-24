class ApplicationMailer < ActionMailer::Base
  default from: 'no-reply@megavision.com'
  layout 'mailer'

  def send_contact_notification(contact)
    return unless contact.class.eql?(Contact)
    @contact = contact
    mail(:reply_to => contact.email,
         :to => Rails.application.secrets.admin_email,
         :subject => '[New Contact] ' + contact.subject)
  end
end
