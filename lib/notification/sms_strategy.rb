module Notification
  class SmsStrategy < Strategy
    # @param [String] destination
    # @param [String] message
    #
    # @return [Boolean]
    def send_notification(destination, message)
      account_sid  = ENV['TWILIO_ACCOUNT_SID']
      auth_token   = ENV['TWILIO_AUTH_TOKEN']
      phone_number = ENV['TWILIO_PHONE_NUMBER']&.gsub(/[^\+0-9]/, '')
      client       = Twilio::REST::Client.new account_sid, auth_token

      message = client.messages.create(
        body: message,
        to: destination,
        from: phone_number)
    end
  end
end
