class EventDecorator < SimpleDelegator
  def self.wrap(collection)
    collection.map do |obj|
      new obj
    end
  end

  def formatted_date
    return if remaining_event_occurrences.blank?

    next_event_date = remaining_event_occurrences
      .first
      .date
      .strftime("%a, %d %b, %Y")

    [next_event_date, formatted_time].join(" ")
  end

  def formatted_time
    return if schedule.nil?

    started_at = schedule.time.strftime("%I:%M %p")
    ended_at = schedule.time_end.strftime("%I:%M %p")

    [started_at, "-", ended_at].join(" ")
  end

  def formatted_location
    [location.address, location.city].join(", ")
  end

  def formatted_organizer
    ["By", organizer.name].join(" ")
  end

end
