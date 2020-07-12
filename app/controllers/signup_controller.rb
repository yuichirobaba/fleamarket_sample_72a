class SignupController < ApplicationController
  
  def new
    @user = User.new
  end
  
  def new2
    session[:nickname] = create_user_params[:nickname]
    session[:email] = create_user_params[:email]
    session[:encrypted_password] = create_user_params[:encrypted_password] 
    session[:family_name] = create_user_params[:first_name]
    session[:first_name] = create_user_params[:family_name_kana]
    session[:family_name_kana] = create_user_params[:family_name_kana]
    session[:first_name_kana] = create_user_params[:first_name_kana]
    session[:birthday_year] = create_user_params[:birthday_year]
    session[:birthday_month] = create_user_params[:birthday_month]
    session[:birthday_day] = create_user_params[:birthday_day]
  @user = User.new
  end
def new3
  session[:zipcode] = create_user_params[:zipcode]
  session[:city] = create_user_params[:city]
  session[:address] = create_user_params[:address]
  session[:building] = create_user_params[:building]
  session[:phone] = create_user_params[:phone]
  @user = User.new
end
  private
  def create_user_params
    paramas.require(:user).permit(
      :nickname,           
      :email,              
      :encrypted_password, 
      :family_name,        
      :first_name,         
      :family_name_kana,   
      :first_name_kana,    
      :birthday_year,       
      :birthday_month,     
      :birthday_day, 
      :zipcode,
      :prefecture,
      :city, 
      :address,
      :building, 
      :phone, 
    )

end
