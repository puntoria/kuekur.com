class Content < ApplicationRecord
  belongs_to :section, touch: true

  validates :title, :description, presence: true
  validates_associated :section
  validates :section_id, presence: true
end
