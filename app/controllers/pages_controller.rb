require 'pp'
class PagesController < ApplicationController
  before_action :set_user
  @name = "You did not provide any name yet"
  
  def index
    #EasyTranslate.api_key = 'AIzaSyB1r3abwQulFPKY_RpduJlonl-x0wHLy7w'

    if @user.facebook
      @access_token = get_fb_auth.token
      puts @graph = Koala::Facebook::API.new(@access_token)
      @name = get_fb_auth.name;
      @fb_feed = @graph.get_connection("RailsGirls.Chisinau", "posts")
    end

    if @user.twitter
      @client_tw = Twitter::REST::Client.new do |config|
        config.consumer_key        = ENV["TWITTER_KEY"]
        config.consumer_secret     = ENV["TWITTER_SECRET"]
        config.access_token        = get_tw_auth.token
        config.access_token_secret = get_tw_auth.secret
      end
      @tw_feed = @client_tw.user_timeline      
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
