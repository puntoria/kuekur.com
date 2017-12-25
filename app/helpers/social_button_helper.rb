module SocialButtonHelper
  def social_button_tag(text, url)
    icon = text.downcase || "fa-link"
    content_tag :a, href: "http://#{url}" do 
      concat content_tag :i, nil, class: "fa fa-#{icon}"
      concat text.to_s
    end
  end
end
