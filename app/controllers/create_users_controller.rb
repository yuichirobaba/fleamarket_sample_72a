class CreateUsersController < ApplicationController
def new
  @user = User.new
end
end

