class PagesController < ApplicationController
  def index
    @user = current_user
    if @user.facebook 
      parse_facebook_cookies
      @access_token = @user["access_token"]
      @graph = Koala::Facebook::GraphAPI.new(@access_token)
    end
    
  end


  private
  def parse_facebook_cookies
    @facebook_cookies ||= Koala::Facebook::OAuth.new.get_user_info_from_cookie(cookies)
  end

  def get_facebook_auth

  end

end
