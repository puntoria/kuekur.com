class EventsController < ApplicationController
  def index
    @events = Event.listed.page(params[:page])
  end

  def new
    @event = build_event
  end

  def show
    @event = find_event

    fresh_when @event
  end

  private

  def build_event
    Event.new
  end

  def find_event
    Event.find(params[:id])
  end
end
