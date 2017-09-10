class MarketingController < ApplicationController
  def index
    @events = Event.listed
  end
end
