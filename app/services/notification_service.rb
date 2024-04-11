
class NotificationService
  def initialize(channel, destination, message)
    @channel = channel
    @destination = destination
    @message = message
  end

  def call
    context = ::Notification::Context.new(@channel).strategy
    context.send_notification(@destination, @message)
  end
end
