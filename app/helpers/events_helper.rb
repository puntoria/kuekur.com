module EventsHelper
  def bookmark_button_tag
    if current_user && @event.bookmarked_by?(current_user)
      bookmark(:delete) do
        capture do
          concat content_tag(:i, nil, class: "fa fa-bookmark-o")
          concat content_tag(:div, t("bookmarks.remove"), class: "icon-box-label")
        end
      end
    else
      bookmark(:post) do
        capture do
          concat content_tag(:i, nil, class: "fa fa-bookmark")
          concat content_tag(:div, t("bookmarks.add"), class: "icon-box-label")
        end
      end
    end
  end

  def bookmark(action, &block)
    link_to(event_bookmarks_path(@event.id), class: "icon-box", method: action.to_sym) do
      content_tag(:div, class: "icon-box-content") do
        yield(:block)
      end
    end
  end
end
