require 'sendgrid-ruby'

# receiver
# notification_sending_rule
# email_sending_rule

# send_notification?
# send_email?
# send_sms?

class EventNotifier
  include SendGrid

  attr_reader :receiver, :model

  def initialize(receiver, model)
    @receiver = receiver
  end

  def notify_all
    schedule = Schedule.all
    schedule.occurrences(DateTime.now)
  end


  # targets
  # send_notification_email
  # send_notification_sms
  # batch_notification_mail
  # batch_notification_sms

  def schedule_job
    rule = :email # user.notification_type.to_sym
    if rule == :sms
      from = "+16178588544"
      to = user.phone_number
      body = event.title
      client = Twilio::REST::Client.new(
        "ACa5eac09ec84d0ab8565e4d1af98e724a",
        "1480787fefaa9f2c015725b0355a1b7c",
      )
      client.messages.create(from: from, to: to, body: body)
    elsif rule == :email
      from = Email.new(email: 'korabhhh@gmail.com')
      to = Email.new(email: 'korab-h@hotmail.com')
      content = Content.new(type: 'text/plain', value: event.title)
      mail = Mail.new(from, "##{event.title}", to, content)
      sg = SendGrid::API.new(api_key: "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")
      sg.client.mail._('send').post(request_body: mail.to_json)
    end
  end

end
