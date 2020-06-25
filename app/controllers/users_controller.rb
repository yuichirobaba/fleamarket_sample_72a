class UsersController < ApplicationController

  def show 
  end

  def edit
  end

  def update
    if current_user.update(user_params)
      redirect_to user_path(current_user.id)
    else
      redirect_to user_path(current_user.id)
    end
  end
end
