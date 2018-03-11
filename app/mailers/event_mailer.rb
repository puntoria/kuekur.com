class EventMailer < ApplicationMailer
  def new_event(receiver, event)
    @receiver = receiver
    @event = event
    return unless @event.location

    mail(
      subject: "New event posted: '#{@event.title}'"
    )
  end
end
