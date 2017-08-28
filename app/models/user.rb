class User < ApplicationRecord
  include Clearance::User

  has_many :events, dependent: :delete_all

  has_many :bookmarks

  validates :name, presence: true

  has_attached_file :avatar,
    default_url: :letter_avatar_url,
    use_timestamp: false,
    styles: {
      thumb: "49x49#",
      small: "70x70#",
      medium: "300x200>" }

  validates_attachment_content_type :avatar, content_type: [
    "image/jpg",
    "image/jpeg",
    "image/png",
  ]

  def first_name
    name.split(" ").first
  end

  def last_name
    name.split(" ").drop(1).join(" ")
  end

  private

  def letter_avatar_url
    LetterAvatar.generate(self.name, 49)
  end

end
