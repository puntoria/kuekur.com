module FormHelper
  def new_event(event)
    event.location  ||= Location.new(
      locatable: event
    )
    event.category  ||= Category.new
    event.organizer ||= Organizer.new
    event
  end

end
