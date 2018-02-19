class Event < ApplicationRecord
  include Searchable

  EVENT_TYPES = %i[
    performance
    class
    other
    tour
    seminar
    attraction
    party
    festival
    networking
    conference
    screening
    appearance
    gala
    game
    expo
    convention
  ].freeze

  has_attached_file :image, styles: {
    grid: '454x320#',
    list: '362x250#',
    large: '1140x800^'
  }
  validates_attachment :image, presence: true, content_type: {
    content_type: 'image/jpeg'
  }
  acts_as_attendable :event_members, by: :users
  acts_as_schedulable :schedule, occurrences: :event_occurrences
  act_as_bookmarkee

  has_one :location, as: :locatable

  belongs_to :category
  belongs_to :organizer
  belongs_to :user

  validates :title, presence: true
  validates :description, presence: true
  validates :start_date, :end_date, presence: true
  validates :created, :updated, presence: true
  validates :status, presence: true

  accepts_nested_attributes_for(:location, :category, :organizer)

  enum status: %i[draft published live ended canceled]
  enum ticket_class: %i[free paid donation]
  enum event_type: EVENT_TYPES

  def self.listed
    where(listed: true, status: %i[published live])
  end

  def self.upcoming
    listed.where('events.end_date > ?', Time.now.utc).order('events.start_date')
  end

  def self.ordered
    order 'name ASC'
  end

  def self.newest_first
    listed.order 'created_at DESC'
  end
end
