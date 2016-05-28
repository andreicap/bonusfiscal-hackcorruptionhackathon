
class PagesController < ApplicationController
  before_action :set_user
  def index
    if @user.facebook
      @access_token = @user.authentications.find_by_provider(:facebook).token
      @graph = Koala::Facebook::API.new(@access_token)
      puts get_fb_auth.uid, "-----"
      puts @graph.get_connections("me", "feed")
      @name = get_fb_auth.name
    end
    
  end

  

  def get_fb_auth
    @user.authentications.find_by_provider(:facebook)
  end

   def get_tw_auth
    @user.authentications.find_by_provider(:twitter)
  end

   def get_ig_auth
    @user.authentications.find_by_provider(:instagram)
  end

  def set_user
    @user = current_user
  end

end
