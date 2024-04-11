module Notification
  class Strategy
    # @abstract
    #
    # @param [String] destination
    # @param [String] message
    def send_notification(destination, message)
      raise NotImplementedError, "#{self.class} has not implemented method '#{__method__}'"
    end
  end
end
