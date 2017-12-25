module UsersHelper
  include LetterAvatar::AvatarHelper

  def user_avatar_tag(user, style_name, size)
    url_generator = 
      if user.avatar.present?
        user.avatar.url(style_name.to_sym)
      else
        letter_avatar_url(user.name, size)
      end

    image_tag(url_generator, class: "user-avatar")
  end
end
