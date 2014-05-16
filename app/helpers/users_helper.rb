module UsersHelper
  def gravatar_for (user, options = { size: 150 })
    size = options[:size]
    gravatar_md5 = Digest::MD5.hexdigest(user.email.downcase)
    gravatar_url =
    "http://secure.gravatar.com/avatar/#{gravatar_md5}?s=#{size}&d=monsterid"
#    "http://secure.gravatar.com/avatar/#{gravatar_md5}?s=250"
    image_tag(gravatar_url, alt: user.lastname, class: "gravatar")

  end
end



