class EventEditor
  attr_reader :user, :params

  def initialize(user, params)
    @user = user
    @params = params
  end

  def create
    event = Event.new(event_params)
    result = EventEditorResult.new(event: event)

    event.category = result.category
    event.organizer = result.organizer
    event.user = user

    event.location.latitude = 42.6026
    event.location.longitude = 20.9030
    event.created = event.updated = DateTime.now
    event.status = :published

    event.event_members.build({
      invitable: user,
      rsvp_status: :attending
    })

    unless event.save
      result.render = :new

      return result
    end

    if event.canceled?
      result.notice = 'Saved!'

      result.render = :edit
    end

    result
  end

  def update()
  end

  class EventEditorResult
    attr_accessor(
      :event,
      :notice,
      :render,
      :status
    )

    def initialize(event:, notice: nil, render: nil, status: nil)
      @event  = event
      @notice = notice
      @render = render
      @status = status
    end

    def category
      Category.where(name: event.category.name).
        first_or_create
    end

    def organizer
      Organizer.where(name: event.organizer.name).
        first_or_create
    end

  end

  private

  def event_params
    params.require(:event).permit(
      :title,
      :description,
      :start_date,
      :end_date,
      :invite_only,
      :ticket_class,
      :tag_list,
      schedule_attributes: Schedulable::ScheduleSupport.param_names,
      location_attributes: [:address, :city, :country],
      category_attributes: [:name],
      organizer_attributes: [:name, :description, :facebook, :twitter, :instagram]
    ).
    merge(user: user)
  end

end
