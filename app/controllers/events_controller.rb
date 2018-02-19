class EventsController < ApplicationController
  layout 'fluid', only: :show
  before_action :require_login, except: %i[index show]

  def index
    where_clause = {}
    where_clause[:event_type]   = params[:event_type] if params[:event_type].present?
    where_clause[:city]         = params[:city] if params[:city].present?
    where_clause[:category]     = params[:category] if params[:category].present?
    where_clause[:ticket_class] = params[:ticket_class] if params[:ticket_class].present?
    where_clause[:status]       = params[:status] if params[:status].present?
    boost_fields = [
      'title',
      'description',
      'status',
      'event_type',
      'ticket_class',
      'location.address',
      'location.city',
      'location.country',
      'category.name'
    ]
    @events = Event.search(
      query,
      where: where_clause,
      misspellings: {
        below: 3,
        edit_distance: 2
      },
      fields: boost_fields,
      smart_aggs: true,
      aggs: %i[city category event_type ticket_class status],
      per_page: 20,
      page: params[:page],
      debug: true
    )
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
    event_member = event.event_members.where(['invitable_id = ?', current_user.id])[0]

    if event_member
      event_member.rsvp_status = params[:rsvp_status]
    else
      event_member = event.event_members.build(invitable: current_user, rsvp_status: :attending)
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
    params[:search] ? params.dig(:search, :query) : '*'
  end
end
