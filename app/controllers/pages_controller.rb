
class PagesController < ApplicationController
  before_action :set_user
  @name = "You did not provide any name yet"
  
  def index
    #EasyTranslate.api_key = 'AIzaSyB1r3abwQulFPKY_RpduJlonl-x0wHLy7w'

    if @user.facebook
      create_fb
    end

    if @user.twitter
      begin
        @client_tw = Twitter::REST::Client.new do |config|
          config.consumer_key        = ENV["TWITTER_KEY"]
          config.consumer_secret     = ENV["TWITTER_SECRET"]
          config.access_token        = get_tw_auth.token
          config.access_token_secret = get_tw_auth.secret
        end
        @tw_feed = @client_tw.home_timeline
      rescue Exception => msg
        puts "--error--", msg
      end
    end

    if @user.instagram
      client = Instagram.client(:access_token => get_ig_auth.token)
      @ig_feed = client.user_recent_media
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

  def create_fb
    u = @user.feeds.find_by_provider("facebook")
    if !@user.feeds.find_by_provider("facebook")
      @feed = Feed.new
      @feed.provider = "facebook"
      @feed.user_id = @user.id
      @feed.save
      
      begin
        @access_token = get_fb_auth.token
        puts @graph = Koala::Facebook::API.new(@access_token)
        @name = get_fb_auth.name
        @user.first_name = @name
        fb_feed = @graph.get_connection("RailsGirls.Chisinau", "posts")
      rescue Exception => msg
        puts "--error--", msg
      end

      fb_feed.each do |post|
        p = Post.new
        p.feed_id = @feed.id
        p.content = post["message"]
        p.f_id = @feed.id
        puts "-----", p, "-----"
        p.save
      end
    end
    @fb_posts = u.posts.all
  end

  def set_user
    @user = current_user
  end

end
