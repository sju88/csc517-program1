module InstructorsHelper
         # 返回指定用户的 Gravatar
  def gravatar_for(instructor)
    gravatar_id = Digest::MD5::hexdigest(instructor.email.downcase)
    gravatar_url = "https://secure.gravatar.com/avatar/#{gravatar_id}"
    image_tag(gravatar_url, alt: instructor.name, class: "gravatar")
  end
end
