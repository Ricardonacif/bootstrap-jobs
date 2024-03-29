class OmniauthCallbacksController < Devise::OmniauthCallbacksController

  def all
    user = User.from_omniauth(request.env["omniauth.auth"])
    if user.persisted?
      flash.notice = "Welcome to Jobs Bootstrap!"
      sign_in_and_redirect user
    end
  end


  alias_method :twitter, :all
  alias_method :facebook, :all

end
