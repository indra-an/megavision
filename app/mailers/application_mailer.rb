class ApplicationMailer < ActionMailer::Base
  default from: 'no-reply@megavision.com'
  layout 'mailer'

  def send_contact_notification(contact)
    return unless contact.class.eql?(Contact)
    @contact = contact
    @admin_email = Preference.fetch.contact_emails.reject(&:empty?).join(",").delete(' ')

    mail(:reply_to => contact.email,
         :to => @admin_email,
         :subject => '[Contact Us] ' + contact.subject)
  end

  def send_subscriber(data)
    time = Time.zone.now.strftime("%Y%m%d%H%I%S")
    attachments["subscriber_#{time}.pdf"] = SubscribePdf.new(data).render
    @admin_emails = []
    Preference.fetch.subscribe_emails.reject(&:empty?).each do |sub_data|
      split_data = sub_data.split("|")
      email, city = split_data[0], split_data[1]

      if data['city'].downcase == city.try(:downcase)
        @admin_emails << email.delete(' ')
      end

    end
    mail(:reply_to => data['email'],
         :to => @admin_emails.reject(&:empty?).join(","),
         :subject => '[New Subscriber] [' + data['city'] + '] '+ data['email'])
  end
end
