class ApplicationController < ActionController::Base
  before_action :basic_auth, if: :devise_controller?

  private
  def devise_controller?
    Rails.env.devise_controller?
  end

  def basic_auth
    authenticate_or_request_with_http_basic do |username, password|
      username == Rails.application.credentials[:basic_auth][:user] &&
      password == Rails.application.credentials[:basic_auth][:pass]
      devise_parameter_anitizer.permit(:sing_up,keys:[:nickname,:family_name,:first_name,:family_name_kana,:first_name_kana,:birthday_year,:birthday_month,:birthbay_day])
  end
end
end