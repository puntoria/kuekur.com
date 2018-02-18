class LandingPage
  def upcoming_events
    Event.upcoming
  end

  def recently_published_events
    Event.newest_first
  end
end
