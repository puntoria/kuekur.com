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
    @event = build_event

    if @event.save
      redirect_to @event
    else
      render 'new'
    end
  end

  private

  def build_event
    EventForm.new(user: current_user)
  end


  def find_event
    Event.find(params[:id])
  end

end
