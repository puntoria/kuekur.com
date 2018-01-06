if Rails.env.development? || Rails.env.test?
  require "sendgrid-ruby"

  namespace :schedulable do
    desc "Updates the ruby-advisory-db and runs audit"
    task build_occurrences: :environment do
      events = Event.listed.map(&:schedule)
      all_occurrence = Array.new
      events.map { |event|
        if event.occurs_on?(Date.today)
          all_occurrence.push(event)
        end
      }
      if all_occurrence.present?
        all_occurrence.each do |occurrence|
          event = Event.find(occurrence.schedulable_id)
          return if event.nil?

          attendees = event.attendees
          begin
            attendees.each do |attendee|
              receiver = attendee
              # scheduler.at '' do
              if receiver.notification_sending_rule == 'sms'
                send_notification_sms(receiver, event)
              elsif receiver.notification_sending_rule == 'email'
                send_notification_email(receiver, event)
              else
                raise RuntimeError
              end
              # end
            end
          rescue RuntimeError
            Rails.logger.info("Attendees: #{attendees}")
          end
        end
      end
    end
  end

  def send_notification_sms(receiver, event)
    from = "+16178588544"
    to = receiver.phone_number
    client = Twilio::REST::Client.new(
      "ACa5eac09ec84d0ab8565e4d1af98e724a",
      "1480787fefaa9f2c015725b0355a1b7c",
    )
    d = EventDecorator.new(event)
    body = "Join us at our new nest on #{d.formatted_date("%a, %d %b")} from #{d.formatted_time} onwards at #{d.formatted_location}. - #{d.formatted_organizer}."
    client.messages.create(from: from, to: to, body: body)
  end

  def send_notification_email(receiver, event)
    include SendGrid
    d = EventDecorator.new(event)
    body = "Join us at our new nest on #{d.formatted_date("%a, %d %b")} from #{d.formatted_time} onwards at #{d.formatted_location}. - #{d.formatted_organizer}."

    from = Email.new(email: 'korabhhh@gmail.com')
    to = Email.new(email: receiver.email)
    content = Content.new(type: 'text/plain', value: body)
    mail = Mail.new(from, d.formatted_organizer, to, content)
    sg = SendGrid::API.new(api_key: "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")
    sg.client.mail._('send').post(request_body: mail.to_json)
  end

end
