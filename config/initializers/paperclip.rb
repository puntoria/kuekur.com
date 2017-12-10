Paperclip.interpolates :default_avatar_url do |attachment|
  LetterAvatar.generate(self.name, 49)
end
