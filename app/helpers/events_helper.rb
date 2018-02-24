module EventsHelper
  include Rails.application.routes.url_helpers

  def bookmark_button_tag
    if current_user && @event.bookmarked_by?(current_user)
      bookmark(:delete) do
        capture do
          concat content_tag(:i, nil, class: 'fa fa-bookmark-o')
          concat content_tag(:div, t('bookmarks.remove'), class: 'icon-box-label')
        end
      end
    else
      bookmark(:post) do
        capture do
          concat content_tag(:i, nil, class: 'fa fa-bookmark')
          concat content_tag(:div, t('bookmarks.add'), class: 'icon-box-label')
        end
      end
    end
  end

  def bookmark(action)
    link_to(event_bookmarks_path(@event.id), class: 'icon-box', method: action.to_sym) do
      content_tag(:div, class: 'icon-box-content') do
        yield(:block)
      end
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
      via: "kuekur"
    )
  end
end
