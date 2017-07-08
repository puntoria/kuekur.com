class EventsController < ApplicationController
  def index
    @events = Event.all.listed
  end
end
