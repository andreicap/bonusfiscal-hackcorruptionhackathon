
class PagesController < ApplicationController
  before_action :set_user
  @name = "You did not provide any name yet"
  
  def index
    EasyTranslate.api_key = 'AIzaSyB1r3abwQulFPKY_RpduJlonl-x0wHLy7w'
    if @user.facebook
      @access_token = @user.authentications.find_by_provider(:facebook).token
      puts @graph = Koala::Facebook::API.new(@access_token)
      @name = get_fb_auth.name;
      @feed = @graph.get_connection("RailsGirls.Chisinau", "posts")
    end

    if @user.twitter
      
    end
    
   end


   private
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
