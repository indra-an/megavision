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

  def send_subscriber(data)
    time = Time.zone.now.strftime("%Y%m%d%H%I%S")
    attachments["subscriber_#{time}.pdf"] = SubscribePdf.new(data).render

    mail(:reply_to => data['email'],
         :to => Rails.application.secrets.subscription_email,
         :subject => '[New Subscriber] ' + data['email'])
  end
end
