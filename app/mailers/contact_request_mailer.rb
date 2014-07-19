class ContactRequestMailer < ActionMailer::Base
  default from: 'zeto.launchacademy@gmail.com'

  def new_contact_request(sender, recipient)
    @sender = sender
    @recipient = recipient
    if @recipient.user.secondary_email.present?
      mail(to: @recipient.user.secondary_email, subject: "Request to connect with #{@recipient.user.name}.")
    else
      mail(to: @recipient.user.email, subject: "Request to connect with #{@recipient.user.name}.")
    end
  end

  def new_contact_request_receipt(sender, recipient)
    @sender = sender
    @recipient = recipient
    if @sender.secondary_email.present?
      mail(to: @sender.secondary_email, subject: "Request sent to #{@recipient.user.name}")
    else
      mail(to: @sender.email, subject: "Request sent to #{@recipient.user.name}")
    end
  end
end
