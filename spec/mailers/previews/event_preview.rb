# Preview all emails at http://localhost:3000/rails/mailers/event
class EventPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/event/new_event
  def new_event
    EventMailer.new_event
  end

end
