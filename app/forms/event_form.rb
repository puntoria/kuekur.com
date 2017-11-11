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
    presence :country, presence: true
  end

  property :organizer do
    property :name, presence: true
    property :description
    property :twitter
    property :facebook
    property :instagram
  end
end
