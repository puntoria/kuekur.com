module FormHelper
  def input_tag(obj, attribute, wrapper_class, fa_icon)
    content_tag(:div, nil, class: "form-field #{wrapper_class}") do
      obj.input(attribute.to_sym, placeholder: t(".#{attribute}"), label: false)
      content_tag(:i, nil, class: "fa #{fa_icon}")
    end
  end
end
