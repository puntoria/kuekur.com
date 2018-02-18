module Searchable
  extend ActiveSupport::Concern

  included do
    def self.search(query, options = {})
      where_clause = options.fetch(:where, {})
      boost_fields = options.fetch(:fields)
      aggs = options.fetch(:aggs)
      limit = options.fetch(:limit, 20)
      page = options.fetch(:page, (params[:page] || 1))

      search(
        query,
        where: where_clause,
        page: page,
        per_page: limit,
        fields: boost_fields,
        aggs: aggs,
        debug: Rails.env.development?
      )
    end
  end
end
