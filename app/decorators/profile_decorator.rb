class ProfileDecorator < SimpleDelegator
  def self.wrap(collection)
    collection.map do |obj|
      new obj
    end
  end

  def remember_created_at
    "Member since " + created_at.strftime("%b %d, %Y")
  end
end
