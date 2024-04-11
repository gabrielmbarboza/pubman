module Notification
  class EmailStrategy < Strategy
    # @param [String] destination
    # @param [String] message
    #
    # @return [Boolean]
    def send_notification(destination, message)
      CitizenMailer.with(destination: destination, message: message).notify_email.deliver_later
    end
  end
end
