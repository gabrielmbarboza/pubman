module Notification
  class Context
    STRATEGIES = {
      email: ::Notification::EmailStrategy.new,
      sms: ::Notification::SmsStrategy.new
    }

    def initialize(channel)
      @channel = channel&.to_sym
    end

    def strategy
      STRATEGIES[@channel]
    end
  end
end
