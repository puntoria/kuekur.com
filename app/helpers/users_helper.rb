module UsersHelper
  def avatar_tag(user, style:, size:)
    source = avatar_url(user, style, size)
    image_tag(source, class: "user-avatar")
  end

  private

  def avatar_url(user, style, size)
    if user.avatar.exists?
      user.avatar.url(style.to_sym)
    else
      letter_avatar_url(user.name, size) 
    end
  end
end
