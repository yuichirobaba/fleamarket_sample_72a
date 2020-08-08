# frozen_string_literal: true

class CreateUsers::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  # You should configure your model like this:
  # devise :omniauthable, omniauth_providers: [:twitter]

  # You should also create an action method in this controller like this:
  # def twitter
  # end

  # More info at:
  # https://github.com/plataformatec/devise#omniauth

  # GET|POST /resource/auth/twitter
  # def passthru
  #   super
  # end

  def facebook
    authorization
  end

  def google_oauth2
    authorization
  end

  # GET|POST /users/auth/twitter/callback
  def failure
    redirect_to root_path
  end

  # protected

  # The path used when OmniAuth fails
  # def after_omniauth_failure_path_for(scope)
  #   super(scope)
  # end

  private

  def authorization
    sns_info = CreateUser.from_omniauth(request.env["omniauth.auth"])
    @create_user = sns_info[:create_user]

    if @create_user.persisted?
      sign_in_and_redirect @create_user, event: :authentication
    else
      @sns_id = sns_info[:sns].id
      render template: 'devise/registrations/new'
    end
  end
end
