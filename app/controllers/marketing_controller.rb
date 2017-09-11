class MarketingController < ApplicationController
  def index
    @events = events
  end

  private

  def events
    Event.upcoming.limit(8)
  end
end
