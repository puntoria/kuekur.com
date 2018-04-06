class Organizer < ApplicationRecord
  validates :name, presence: true

  has_attached_file :logo,
    use_timestamp: true,
    default_url: 'https://s3.eu-central-1.amazonaws.com/kuekur.com/default.png',
    styles: {
      thumb: "49x49#",
      small: "90x90#",
      medium: "300x200>"
    }
    validates_attachment_content_type :logo, content_type: [
      "image/jpg",
      "image/jpeg"
    ]
end
