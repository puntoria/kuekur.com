class EventsController < ApplicationController
  layout "fluid", only: :show

  before_filter :require_login

  def index
    @events = Event.listed.page(params[:page])
  end

  def show
    @event = EventDecorator.new(find_event)
  end

  def new
    @event = Event.new
  end

  def create
    result = build_event

    @event = result.event

    flash[:notice] = result.notice if result.notice

    if result.render
      render result.render
    else
      redirect_to event_path(result.event)
    end
  end

  private

  def build_event
    EventEditor.new(current_user, params).create
  end

  def find_event
    Event.find(params[:id])
  end

end
