class Location < ApplicationRecord
  belongs_to :locatable, polymorphic: true

  validates :address, :city, :country, presence: true
  validates :latitude, :longitude, presence: true

  validates :latitude, numericality: {
    greater_than_or_equal_to: -90,
    less_than_or_equal_to: 90,
    allow_nil: true,
  }

  validates :longitude, numericality: {
    greater_than_or_equal_to: -180,
    less_than_or_equal_to: 180,
    allow_nil: true,
  }

end
