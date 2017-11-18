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

    if @event.validate(params[:event])
      @event.save do |data, map|
        require 'pry'; binding.pry
        event = Event.new(data[:event])
        event.user = current_user
        event.url = "https://"
        event.created = DateTime.now
        event.updated = DateTime.now
        event.location = Location.last
        event.category = Category.last
        event.status = :started
        event.save!
      end
      redirect_to @event
    else
      render 'new'
    end
  end

  private

  def build_event
    EventForm.new(Event.new)
  end


  def find_event
    Event.find(params[:id])
  end

end
