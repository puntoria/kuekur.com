# frozen_string_literal = true
module ApplicationHelper
  def google_map_iframe(lat, lon, opts = {})
    return if (lat || lon).nil?

    width = opts[:width] ? opts.fetch(:width) : '266'
    height = opts[:height] ? opts.fetch(:height) : '266'
    frameborder = opts[:frameborder] ? opts.fetch(:frameborder) : '0'
    zoom = opts[:zoom] ? opts.fetch(:zoom) : '17'
    url = ''
    url << 'https://www.google.com/maps/embed/v1/view'
    url << '?key=AIzaSyBFw1oWlQsKf87MwyuJZTia-foHqoQlW-Y'
    url << "&center=#{lat},#{lon}"
    url << "&zoom=#{zoom}"

    content_tag(
      :iframe, '',
      src: url,
      width: width,
      height: height,
      frameborder: frameborder,
      style: 'border:0'
    )
  end
end
