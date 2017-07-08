class Event < ApplicationRecord
  def self.listed
    where(listed: true)
  end
end
