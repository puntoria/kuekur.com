module UsersHelper
  def avatar_url(user)
    if user.avatar.exists?
      user.avatar.url(:thumb)
    else
      letter_avatar_url(user.name, 49) 
    end
  end
end
