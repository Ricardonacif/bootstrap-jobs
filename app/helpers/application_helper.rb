module ApplicationHelper
  def profile_image
    current_user.provider == "facebook" ? "http://graph.facebook.com/#{current_user.uid}/picture" : "https://api.twitter.com/1/users/profile_image?screen_name=#{current_user.name}&size=bigger"
  end
end
