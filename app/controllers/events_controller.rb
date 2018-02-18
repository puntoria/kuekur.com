class EventsController < ApplicationController
  layout "fluid", only: :show
  before_filter :require_login, except: [:index, :show]

  def index
    @events =
      if query.present?
        Event.search(query,
                     page: params[:page],
                     per_page: 20,
                     fields: [:title, :name_tagged],
                     aggs: [:status, :capacity]
                    )
      else
        Event.listed.page(params[:page]).includes(:category, :remaining_event_occurrences, :location)
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

  def rsvp
    event = find_event
    event_member = event.event_members.where(["invitable_id = ?", current_user.id])[0]

    if event_member
      event_member.rsvp_status = params[:rsvp_status]
    else
      event_member = event.event_members.build({invitable: current_user, rsvp_status: :attending})
    end

    if event_member.save
      redirect_to event, notice: 'Status was successfully updated.'
    else
      redirect_to event, notice: 'Status could not be saved.'
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
    params[:search] ? params[:search][:query] : nil
  end

end
