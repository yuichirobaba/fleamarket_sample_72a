class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up) do |user_params|
      user_params.permit(:nickname, :email, :password, :password_confirmation,
                         :family_name, :first_name, :family_name_kana, :first_name_kana, 
                         :birthday_year, :birthday_month, :birthday_day)
    end
  end
  
end