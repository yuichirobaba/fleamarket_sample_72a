class RegistrationsController < ApplicationController
  def new
  end

  def user_registration
    @user = User.new
  end
end
