module AdminsHelper
    # 返回指定用户的 Gravatar
  def gravatar_for(admin)
    gravatar_id = Digest::MD5::hexdigest(admin.email.downcase)
    gravatar_url = "https://secure.gravatar.com/avatar/#{gravatar_id}"
    image_tag(gravatar_url, alt: admin.name, class: "gravatar")
  end
end
