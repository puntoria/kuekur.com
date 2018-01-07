if Rails.env.development? || Rails.env.test?
  require 'rufus-scheduler'

  namespace :schedulable do
    desc "Updates the ruby-advisory-db and runs audit"
    task build_notifications: :environment do
      events = Event.listed.map(&:schedule)
      all_occurrence = []
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
            rufus_jobs = []
            attendees.each do |attendee|
              receiver = attendee
              # job_id = scheduler.at '2030/12/12 23:30:00' do
              job_id = scheduler.in '10s' do
                notification_sending_rule = receiver.notification_sending_rule.to_sym
                if notification_sending_rule == :sms
                  send_notification_sms(receiver, event)
                elsif notification_sending_rule == :email
                  send_notification_email(receiver, event)
                end
              end
              rufus_jobs.push(job_id)
            end
            rufus_jobs.map(&:join)
          rescue Rufus::Scheduler::TimeoutError => exception
            Rails.logger.error "Exception: #{exception.message}"
          end
        end
      end
    end
  end

  def scheduler
    @scheduler ||= Rufus::Scheduler.new
  end

  def send_notification_sms(receiver, event)
    SMSNotifier.new(receiver, event).send_message
  end

  def send_notification_email(receiver, event)
    EmailNotifier.new(receiver, event).send_email
  end

  class SMSNotifier
    def initialize(receiver, event)
      @receiver = receiver
      @event = EventDecorator.new(event)
    end

    def send_message
      body = "Join us at our new nest on #{event.formatted_date("%a, %d %b")} from #{event.formatted_time} onwards at #{event.formatted_location}. - #{event.formatted_organizer}."

      client.messages.create(from: from, to: receiver.phone_number, body: body)
    end

    private

    attr_reader :receiver, :event

    def client
      @client =|| Twilio::REST::Client.new(
        "ACa5eac09ec84d0ab8565e4d1af98e724a",
        "1480787fefaa9f2c015725b0355a1b7c",
      )
    end

    def from
      "+1617858854"
    end
  end

  class EmailNotifier
    include SendGrid

    def initialize(receiver, event)
      @receiver = receiver
      @event = EventDecorator.new(event)
    end

    def send_email
      body = "Join us at our new nest on #{event.formatted_date("%a, %d %b")} from #{event.formatted_time} onwards at #{event.formatted_location}. - #{event.formatted_organizer}."

      to = Email.new(email: receiver.email)
      content = Content.new(type: 'text/plain', value: body)
      mail = Mail.new(from, d.formatted_organizer, to, content)

      sendgrid.client.mail._('send').post(request_body: mail.to_json)
    end

    private

    def sendgrid
      @client =|| SendGrid::API.new(
        api_key: "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"
      )
    end

    def from
      Email.new(email: 'korabhhh@gmail.com')
    end
  end

end
