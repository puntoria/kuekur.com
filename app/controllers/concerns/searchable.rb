module Searchable
  extend ActiveSupport::Concern

  included do
    def self.search(query, options = {})
      limit = options.fetch(:limit, 20)
      page = options.fetch(:page, params[:page])
      fields = options.fetch(:fields)
      aggs = options.fetch(:aggs)

      search(
        query,
        page: page,
        per_page: limit,
        fields: fields,
        aggs: aggs
      )
    end
  end

end
