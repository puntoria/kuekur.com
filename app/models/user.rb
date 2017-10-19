class User < ApplicationRecord
  include Clearance::User

  act_as_bookmarker

  has_many :events, dependent: :delete_all

  validates :name, presence: true

  has_attached_file :avatar,
    default_url: :letter_avatar_url,
    use_timestamp: false,
    styles: {
      thumb: "49x49#",
      small: "70x70#",
      medium: "300x200>" 
    }

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

  def bookmarks
    bookmarkees.map(&:bookmarkee)
  end

  private

  def letter_avatar_url
    LetterAvatar.generate(self.name, 49)
  end

end
