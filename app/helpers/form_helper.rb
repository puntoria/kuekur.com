module FormHelper
  def new_event(event)
    event.location ||= Location.new(
      locatable: event
    )
    event
  end

end
