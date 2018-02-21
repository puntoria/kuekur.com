require 'active_support/concern'

module Searchable
  extend ActiveSupport::Concern

  included do
    after_commit :reindex_event

    searchkick(callbacks: :async)
  end

  def reindex_event
    reindex
  end

  # only index published, live records
  def should_index?
    published? || live?
  end

  def search_data
    {
      title: maybe_take(self, :title),
      description: maybe_take(self, :description),
      status: maybe_take(self, :status),
      event_type: maybe_take(self, :event_type),
      ticket_class: maybe_take(self, :ticket_class),
      address: maybe_take(location, :address),
      city: maybe_take(location, :city),
      country: maybe_take(location, :country),
      category: maybe_take(category, :name),
      organizer:  maybe_take(organizer, :name),
      created_at: maybe_take(self, :created_at),
      updated_at: maybe_take(self, :updated_at),
      attendees_count: maybe_take(attendees, :count)
    }
  end

  private

  def maybe_take(obj, input)
    obj.try(input.to_sym) if obj.present?
  end
end
