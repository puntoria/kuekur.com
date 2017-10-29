class Event < ApplicationRecord
  act_as_bookmarkee

  has_one :location, as: :locatable
  has_one :organizer

  belongs_to :user

  validates :title, presence: true
  validates :description, presence: true
  validates :url, presence: true
  validates :start_date, :end_date, presence: true
  validates :created, :updated, presence: true
  validates :status, presence: true

  enum status: [
    :canceled,
    :live,
    :started,
    :ended,
    :completed
  ]

  def self.listed
    where(listed: true)
  end

  def self.upcoming
    where('events.end_date > ?', Time.now.utc).order('events.start_date')
  end

  def self.ordered
    order 'name ASC'
  end 

  def self.newest_first
    order 'created_at DESC'
  end
end
