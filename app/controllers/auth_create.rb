... 
 def all
  omniauth = request.env["omniauth.auth"]
  authentication = Authentication.find_by_provider_and_uid(omniauth['provider'], omniauth['uid'])
  @user = current_user
...   
    create_new_authentication omniauth
    @user[omniauth.provider] = true
    @user.save
...
  end
  def create_new_authentication omniauth
    info = {}
    info[:provider] = omniauth.provider
    info[:uid]      = omniauth.uid
    info[:name]     = omniauth.info.name
    info[:email]    = omniauth.info.email
    info[:token]    = omniauth.credentials.token
    info[:secret]   = info[:provider] == "twitter" ? omniauth.credentials.secret : ""
...
    current_user.authentications.create!(info)
  end
...
