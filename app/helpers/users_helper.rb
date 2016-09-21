module UsersHelper
  #returns Gravatar for the user
  def gravatar_for(user, size: 100)
    gravatar_id = Digest::MD5::hexdigest(user.email.downcase)
    gravatar_url = "https://secure.gravatar.com/avatar/#{gravatar_id}?s=#{size}"
    image_tag(gravatar_url, alt: user.name, class: "gravatar")
  end

  def formatted_email
    "#{@name} <#{@email}>"
  end
end
