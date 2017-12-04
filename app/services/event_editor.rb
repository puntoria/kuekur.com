class EventEditor
  attr_reader :user, :params

  def initialize(user, params)
    @user = user
    @params = params
  end

  def create
    event = Event.new(event_params)
    result =
      EventEditorResult.new(event: event)
    event.user = user

    event.created = event.updated = DateTime.now
    event.status = :started

    event.location.latitude, event.location.longitude = 42.6026, 20.9030

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

    def location
      event.location ||= Location.new(
        locatable: event
      )
    end

    def category
      event.category ||= Category.last
    end

    def organizer
      event.organizer ||= Organizer.new
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
      location_attributes: [:address, :city, :country],
      category_attributes: [:name],
      organizer_attributes: [:name, :description, :facebook, :twitter, :instagram]
    ).
    merge(user: user)
  end

end
