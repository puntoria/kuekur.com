class LandingPage
  def upcoming_events
    Event.listed.upcoming
  end

  def recently_published_events
    Event.listed.newest_first
  end
end
