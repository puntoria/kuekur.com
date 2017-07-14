if Rails.env.development? || Rails.env.test?
  require "factory_girl"

  namespace :dev do
    desc "Sample data for local development environment"
    task prime: "db:setup" do
      include FactoryGirl::Syntax::Methods

      create_events
    end
  end

  def create_events
    header "Events"

    @event1 = FactoryGirl.create(
      :event,
      title: "Catch The Anointing Conference", 
      listed: true
    )
    puts_event @event1, 'event'
    
    @event2 = FactoryGirl.create(
      :event,
      title: "Trade Pass: London Design Fair 2017", 
      start_date: 10.days.ago,
      end_date: 1.day.ago,
      shareable: true,
      listed: true
    )
    puts_event @event2, 'event'
  end

  def header(msg)
    puts "\n\n*** #{msg.upcase} *** \n\n"
  end

  def puts_event(event, description)
    puts "#{event.title} / #{event.description} (#{description})"
  end

end
