module EventsHelper
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
    # content_tag(:div, class: "reveal", id: "exampleModal1", data: { reveal: ''}) do
    #   content_tag(:h1, "Awesome. I Have It.")
      social_share_button_tag(
        event.title,
        url: "http://myapp.com/foo/bar",
        image: "http://foo.bar/images/a.jpg",
        desc: "The summary of page",
        via: "#kuekur.com"
      )
    # end
    # link_to("Click me for a modal", data: { open: "exampleModal1" })
  end
end
