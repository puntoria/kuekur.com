class Organizer < ApplicationRecord
  belongs_to :event

  validates :name, presence: true

  has_attached_file :logo,
    use_timestamp: true,
    styles: {
      thumb: "49x49#",
      small: "70x70#",
      medium: "300x200>" 
    }
    validates_attachment_content_type :logo, content_type: [
      "image/jpg",
      "image/jpeg"
    ]
end
