class CreateUsersController < ApplicationController
  
  def edit

  end

  def create
    @user = CreateUser.new(sign_up_params)
  end

  def update
    if current_user.update(sign_up_params)
      redirect_to :new2
    else
      render :new
    end
  end

  private

  def sign_up_params
    params.permit(
      :nickname, :email, :password, :password_confirmation, :family_name, 
      :first_name, :family_name_kana, :first_name_kana)
  end
end
