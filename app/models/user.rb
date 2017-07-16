class User < ApplicationRecord
  include Clearance::User

  validates :name, presence: true

  has_attached_file :avatar,
    use_timestamp: false,
    styles: {
      thumb: "49x49#",
      small: "100x75>",
      medium: "300x200>" }

  validates_attachment_content_type :avatar, :content_type => [
    "image/jpg",
    "image/jpeg",
    "image/png",
    "image/gif"
  ]

  def first_name
    name.split(" ").first
  end

  def last_name
    name.split(" ").drop(1).join(" ")
  end

end
