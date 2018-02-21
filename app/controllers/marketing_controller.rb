class MarketingController < ApplicationController
  def index
    @events = events
  end

  private

  def events
    EventList.new(params).retrieve_events
  end
end
