class EventsController < ApplicationController
  def index
    @events = Event.listed.page(params[:page])
  end

  def show
    @event = find_event

    fresh_when @event
  end

  def new
    @event = build_event
  end

  def create
    redirect_to :back, flash: { 
      success: "Great! It worked." 
    }
  end

  private

  def build_event
    Event.new
  end

  def find_event
    Event.find(params[:id])
  end
end
