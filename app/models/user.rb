class User < ApplicationRecord
  include Clearance::User

  validates :name, presence: true

  has_attached_file :avatar

  def first_name
    name.split(" ").first
  end

  def last_name
    name.split(" ").drop(1).join(" ")
  end
end
