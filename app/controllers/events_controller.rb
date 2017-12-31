class EventsController < ApplicationController
  layout "fluid", only: :show
  before_filter :require_login, except: [:index, :show]

  def index
    @events =
      if query.present?
        Event.search(query,
                     page: params[:page],
                     per_page: 20,
                     fields: [:title],
                     aggs: [:status, :capacity]
                    )
      else
        Event.listed.page(params[:page])
      end
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

  def query
    params[:search] ? params[:search][:q] : nil
  end

end
