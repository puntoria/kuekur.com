class EventList
  def initialize(params)
    @params = params
  end

  def retrieve_events
    base_elasticsearch
  end

  private

  attr_reader :params

  def base_elasticsearch
    curr_page = params[:page] || 1

    Event.search(
      keyword_query,
      fields: search_field,
      where: where_query,
      aggs: aggregations,
      smart_aggs: true,
      order: sorted,
      page: curr_page,
      per_page: per_page,
      debug: debug?
    )
  end

  def keyword_query
    params.dig(:search, :query) || '*'
  end

  def search_field
    [
      'title',
      'description',
      'status',
      'event_type',
      'ticket_class',
      'address',
      'city',
      'country',
      'category',
      'organizer'
    ]
  end

  def where_query
    where_query = {
      event_type: params.fetch(:event_type, nil),
      city: params.fetch(:city, nil),
      category: params.fetch(:category, nil),
      ticket_class: params.fetch(:ticket_class, nil),
      status: params.fetch(:status, nil)
    }
    apply_filters(where_query)
  end

  def sorted
    order_params = {}
    order_by = params.fetch(:order_by, 'newest')
    order_params[:attendees_count] = :desc if order_by == 'popular'
    order_params[:created_at] = :asc if order_by == 'newest'
    order_params
  end

  def aggregations
    %i[city category event_type ticket_class status]
  end

  def per_page
    params.fetch(:per_page, 20)
  end

  def debug?
    Rails.env.development?
  end

  def apply_filters(hash)
    return if hash.blank?

    hash.delete_if { |_, value| value.nil? }
  end
end
