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

  def search_data
    {
      title: maybe_take(self, :title),
      description: maybe_take(self, :description),
      status: maybe_take(self, :status),
      ticket_class: maybe_take(self, :ticket_class),
      address: maybe_take(self.location, :address),
      city: maybe_take(self.location, :city),
      country: maybe_take(self.location, :country),
      category: maybe_take(self.category, :name)
    }
  end

  private

  def maybe_take(obj, input)
    obj.try(input.to_sym) if obj.present?
  end
end
