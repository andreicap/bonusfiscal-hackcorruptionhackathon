class CallbacksController < Devise::OmniauthCallbacksController

  def all
    omniauth = request.env["omniauth.auth"]
    authentication = Authentication.find_by_provider_and_uid(omniauth['provider'], omniauth['uid'])
    @user = current_user
    if authentication
      flash[:notice] = "Signed in successfully."
      sign_in_and_redirect(:user, authentication.user)
    elsif current_user
      create_new_authentication omniauth
      @user[omniauth.provider] = true
      @user.save
      flash[:notice] = "Authentication successful."
      redirect_to edit_user_registration_path
    else
      user = User.new
      user.apply_omniauth(omniauth)
      if user.save
        flash[:notice] = "Signed in successfully."
        sign_in_and_redirect(:user, user)
      else
        session[:omniauth] = omniauth.except('extra')
        redirect_to new_user_registration_url
      end
    end
  end
  
  alias_method :facebook, :all
  alias_method :twitter, :all
  alias_method :instagram, :all


  private

  def create_new_authentication omniauth
    info = {}
    info[:provider] = omniauth.provider
    info[:uid]      = omniauth.uid
    info[:name]     = omniauth.info.name
    info[:email]    = omniauth.info.email
    info[:token]    = omniauth.credentials.token
    info[:secret]   = info[:provider] == "twitter" ? omniauth.credentials.secret : ""
     
    puts
    puts "----------------"
    puts info
    puts "----------------"
    current_user.authentications.create!(info)
    
    
  end
  
end


