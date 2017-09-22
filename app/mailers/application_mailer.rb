class ApplicationMailer < ActionMailer::Base
  default from: 'no-reply@megavision.com'
  layout 'mailer'

  def send_contact_notification(contact)
    return unless contact.class.eql?(Contact)
    @contact = contact
    @admin_email = Preference.fetch.contact_emails.reject(&:empty?).join(",")
    mail(:reply_to => contact.email,
         :to => @admin_email,
         :subject => '[New Contact] ' + contact.subject)
  end

  def send_subscriber(data)
    time = Time.zone.now.strftime("%Y%m%d%H%I%S")
    attachments["subscriber_#{time}.pdf"] = SubscribePdf.new(data).render
    @admin_email = Preference.fetch.subscribe_emails.reject(&:empty?).join(",")
    mail(:reply_to => data['email'],
         :to => @admin_email,
         :subject => '[New Subscriber] [' + data['city'] + '] '+ data['email'])
  end
end
