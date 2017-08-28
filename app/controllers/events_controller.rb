class EventsController < ApplicationController
  def index
    @events = Event.all.listed
  end

  def show
    @event = find_event
  end

  private

  def find_event
    Event.find(params[:id])
  end
end
