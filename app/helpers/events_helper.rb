# frozen_string_literal: true
module EventsHelper
  include Rails.application.routes.url_helpers

  def bookmark_tag(obj, action, options = {})
    html_class = options.fetch(:class, '')
    link_to(event_bookmarks_path(obj.id),
            class: html_class,
            method: action.to_sym) do
      yield
    end
  end

  def link_to_tag(attr)
    url = request.params.deep_merge(search: { query: attr })
    link_to "##{attr}", url
  end

  def price_tag(type)
    content_tag(:div, class: "events-list-item-price #{type}") do
      content_tag(:span, t(".#{type}"))
    end
  end

  def social_share_tag(event)
    social_share_button_tag(
      event.title,
      url: request.base_url + event_path(event),
      image: event.image.url(:full),
      desc: event.description,
      via: 'kuekur'
    )
  end
end
