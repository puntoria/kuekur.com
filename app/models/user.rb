class User < ApplicationRecord
  include Clearance::User

  def first_name
    name.split(" ").first
  end

  def last_name
    name.split(" ").drop(1).join(" ")
  end
end
