class EventsController < ApplicationController
  before_filter :require_login

  def index
    @events = Event.listed.page(params[:page])
  end

  def show
    @event = find_event

    fresh_when @event
  end

  def new
    @event = Event.new
  end

  def create
    @event = build_event
    @event.user = current_user

    @event.created = @event.updated = DateTime.now

    @event.status = :started

    @event.location.latitude  = 42.6026
    @event.location.longitude = 20.9030

    if @event.save
      redirect_to event_path(@event)
    else
      render :new
    end
  end

private

  def build_event
    Event.new(event_params)
  end

  def find_event
    Event.find(params[:id])
  end

  def event_params
    params.require(:event).permit(
      :title,
      :description,
      :start_date,
      :end_date,
      :invite_only,
      location_attributes: [:address, :city, :country],
      category_attributes: [:name],
      organizer_attributes: [:name, :description, :facebook, :twitter, :instagram]
    )
  end

end
