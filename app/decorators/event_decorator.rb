class EventDecorator < SimpleDelegator
  def self.wrap(collection)
    collection.map do |obj|
      new obj
    end
  end

  def formatted_date(strf = "%a, %d %b, %Y, %I:%M %p")
    started_at = start_date.strftime(strf)
    ended_at = if start_date === end_date
                 end_date.strftime("%I:%M %p")
               else
                 end_date.strftime(strf)
               end
    
    [started_at, "-", ended_at].join(" ")
  end

  def formatted_location
    [location.address, location.city].join(", ")
  end

  def formatted_organizer
    ["By", organizer.name].join(" ")
  end

  def formatted_time
    started_at = start_date.strftime("%I:%M %p")
    ended_at = end_date.strftime("%I:%M %p")
    
    [started_at, "-", ended_at].join(" ")
  end

end
