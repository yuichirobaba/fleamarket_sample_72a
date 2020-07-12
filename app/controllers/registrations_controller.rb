class RegistrationsController < ApplicationController
  def new
    render "devise/registrations/new"
  end


  def user_registration
    @user = User.new
  end
end

