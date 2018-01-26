class Section < ApplicationRecord
  has_many :contents, dependent: :destroy

  validates :title, presence: true
end
