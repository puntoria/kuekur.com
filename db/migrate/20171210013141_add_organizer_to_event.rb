class AddOrganizerToEvent < ActiveRecord::Migration[5.0]
  def change
    add_reference :events, :organizer, foreign_key: true, index: true
  end
end
