class CitizenMailer < ApplicationMailer
  def notify_email
    destination = params[:destination]
    subject     = params[:subject]
    @message    = params[:message]

    mail(to: destination, subject: subject)
  end
end
