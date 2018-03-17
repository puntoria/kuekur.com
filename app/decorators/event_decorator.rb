class EventDecorator < SimpleDelegator
  include ActionView::Helpers::TextHelper
  class MissingAttributeError < StandardError; end

  def self.wrap(collection)
    collection.map do |obj|
      new obj
    end
  end

  def date
    if remaining_event_occurrences.present?
      remaining_event_occurrences.first.try(:date)
    elsif schedule.present?
      schedule.try(:date)
    else
      raise MissingAttributeError 'missing attribute `:date`'
    end
  end

  def formatted_date(strf = '%a, %d %b, %Y')
    date.strftime(strf)
  end

  def formatted_date_time(strf = '%a, %d %b, %Y')
    next_event_date = date.strftime(strf)
    [next_event_date, formatted_time].join(' ')
  end

  def formatted_time
    started_at = schedule.time.strftime('%I:%M %p')
    ended_at = schedule.time_end.strftime('%I:%M %p')
    [started_at, '-', ended_at].join(' ')
  end

  def formatted_location
    [location.address, location.city].join(', ')
  end

  def formatted_organizer
    organizer.try(:name)
  end

  def attendee_list
    pluralize(attendees.count, 'Attendees', 'Attendee')
  end
end
