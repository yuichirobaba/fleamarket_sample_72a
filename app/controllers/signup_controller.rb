class SignupController < ApplicationController
  
  def index
  end
  
  def new
  end

  def user_registration
    @user = User.new
  end

end
