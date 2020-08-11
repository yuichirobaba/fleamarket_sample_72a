# frozen_string_literal: true

class Users::RegistrationsController < Devise::RegistrationsController
  # before_action :configure_sign_up_params, only: [:create]
  # before_action :configure_account_update_params, only: [:update]

  # GET /resource/sign_up
  def new
    @create_user = User.new
  end

  # POST /resource
  def create
    @create_user = User.new(sign_up_params)
    unless @create_user.valid?
      flash.now[:alert] = @create_user.errors.full_messages
      render :new and return
    end
    session["devise.regist_data"] = {user: @create_user.attributes}
    session["devise.regist_data"][:user]["password"] = params[:create_user][:password]
    @delivary_data = @create_user.build_delivary_data
    render :new_delivary_data
  end

  def create_delivary_data
    @create_user = User.new(session["devise.regist_data"]["user"])
    @delivary_data = DelivaryData.new(delivary_data_params)
    unless @delivary_data.valid?
      flash.now[:alert] = @delivary_data.errors.full_messages
      render :new_delivary_data and return
    end
    @create_user.build_delivary_data(@delivary_data.attributes)
    @create_user.save
    session["devise.regist_data"]["user"].clear
    sign_in(:user, @create_user)
  end

  # GET /resource/edit
  # def edit
  #   super
  # end

  # PUT /resource
  # def update
  #   super
  # end

  # DELETE /resource
  # def destroy
  #   super
  # end

  # GET /resource/cancel
  # Forces the session data which is usually expired after sign
  # in to be expired now. This is useful if the user wants to
  # cancel oauth signing in/up in the middle of the process,
  # removing all OAuth session data.
  # def cancel
  #   super
  # end

  protected

  def delivary_data_params
    params.require(:delivary_data).permit(
      :zipcode, :prefecture, :city, :address,
      :building, :phone)
    end

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_up_params
  #   devise_parameter_sanitizer.permit(:sign_up, keys: [:attribute])
  # end

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_account_update_params
  #   devise_parameter_sanitizer.permit(:account_update, keys: [:attribute])
  # end

  # The path used after sign up.
  # def after_sign_up_path_for(resource)
  #   super(resource)
  # end

  # The path used after sign up for inactive accounts.
  # def after_inactive_sign_up_path_for(resource)
  #   super(resource)
  # end
end
