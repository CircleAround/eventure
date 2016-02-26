module ApplicationHelper
  def url_for_twitter(user)
    "https://twitter.com/#{user.nickname}"
  end

  def resource_name
    :user
  end

  def resource
    @resource ||= User.new
  end

  def devise_mapping
    @devise_mapping ||= Devise.mappings[:user]
  end
end
