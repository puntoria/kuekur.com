class User < ApplicationRecord
  include Clearance::User
  include CommonValidator

  act_as_bookmarker
  acts_as_messageable

  has_many :events, dependent: :delete_all

  validates :name, presence: true

  has_attached_file :avatar,
                    default_url: ':default_avatar_url',
                    use_timestamp: false,
                    styles: {
                      thumb: '49x49#',
                      small: '70x70#',
                      medium: '300x200>'
                    }
  validates_attachment_content_type :avatar, content_type: [
    'image/jpg',
    'image/jpeg',
    'image/png'
  ]

  def first_name
    name.split(' ').first
  end

  def last_name
    name.split(' ').drop(1).join(' ')
  end

  def bookmarks
    bookmarkees.map(&:bookmarkee)
  end

  def mailboxer_name
    self.name
  end

  def mailboxer_email(object)
    self.email
  end

end
