if Rails.env.development? || Rails.env.test?
  require "factory_girl"

  namespace :dev do
    desc "Sample data for local development environment"
    task prime: "db:setup" do
      include FactoryGirl::Syntax::Methods

      create_users
      create_events
      create_bookmarks
    end
  end

  def create_users
    header "Users"

    @user1 = FactoryGirl.create(
      :user,
      name: "New User",
      email: "new@example.com",
      age: 22,
      birth_date: Date.today - 22.years,
      gender: 0,
      website: "https://mozaixllc.com",
      bio: "And your forms will use this information to render the components for you.",
      phone_number: "+1-541-754-3010",
      email_verified: true,
      phone_verified: true,
    )
    puts_user @user1, 'user'

    @user2 = FactoryGirl.create(
      :user,
      name: "Old User",
      email: "old@example.com",
      age: 85,
      birth_date: Date.today - 85.years,
      gender: 1,
      website: "www.busulla.com",
      bio: "You can set their default values to false or use the optional method.",
      phone_number: "+1-541-754-3010",
      email_verified: true,
      phone_verified: true,
    )
    puts_user @user2, 'user'
  end

  def create_events
    header "Events"

    @event1 = FactoryGirl.create(
      :event,
      :listed,
      title: "Catch The Anointing Conference",
      user_id:  @user1.id
    )
    puts_event @event1, 'event'

    @event2 = FactoryGirl.create(
      :event,
      :listed,
      title: "Trade Pass: London Design Fair 2017",
      start_date: Time.zone.now,
      end_date: Time.zone.now + 1.hours,
      shareable: true,
      user_id: @user2.id
    )
    puts_event @event2, 'event'
  end

  def create_bookmarks
    header "Bookmarks"

    @user1.bookmark(@event2)
    puts_boomark @event2, @user1, 'bookmark'

    @user2.bookmark(@event1)
    puts_boomark @event1, @user2, 'bookmark'
  end

  def header(msg)
    puts "\n\n*** #{msg.upcase} *** \n\n"
  end
  
  def puts_user(user, description)
    puts "#{user.name} / #{user.email} (#{description})"
  end

  def puts_event(event, description)
    puts "#{event.title} / #{event.description} (#{description})"
  end

  def puts_boomark(event, user, description)
    puts "#{event.title} / #{user.name} (#{description})"
  end

end
