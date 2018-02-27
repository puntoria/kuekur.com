module UsersHelper
  include LetterAvatar::AvatarHelper

  def avatar_tag(user, style_name, size)
    source = if user.avatar
      user.avatar.url(style_name.to_sym)
    else
      letter_avatar_url(user.name, size)
    end
    image_tag(source, class: 'user-avatar')
  end
end
