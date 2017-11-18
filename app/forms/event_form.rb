class EventForm < Reform::Form
  include Reform::Form::ActiveModel

  property :title, presence: true
  property :description
  property :start_date, presence: true
  property :end_date, presence: true
  property :invite_only

  property :location do
    property :address, presence: true
    property :city, presence: true
    property :country, presence: true
  end

end
