class ContactRequestMailer < ActionMailer::Base
  default from: 'zeto.launchacademy@gmail.com'

  def new_contact_request(sender, recipient)
    @sender = sender
    @recipient = recipient
    mail(to: @recipient.email, subject: "Request to connect with #{@recipient.name}.")
  end

  def new_contact_request_receipt(sender, recipient)
    @sender = sender
    @recipient = recipient
    mail(to: @sender.email, subject: "Request sent to #{@recipient.name}")
  end
end
