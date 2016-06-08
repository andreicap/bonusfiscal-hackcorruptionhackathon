
class PagesController < ApplicationController
  before_action :set_user
  @name = "You did not provide any name yet"
  
  def index
    if @user.facebook
      create_fb
      @fb_posts = @user.feeds.find_by_provider("facebook").posts
    end

    if @user.twitter
      create_tw
      @tw_posts = @user.feeds.find_by_provider("twitter").posts
    end

    if @user.instagram
      create_ig
      @ig_posts = @user.feeds.find_by_provider("instagram").posts
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
    feed = @user.feeds.find_by_provider("facebook")
    if !feed
      feed = Feed.new
      feed.provider = "facebook"
      feed.user_id = @user.id
      feed.save
      begin
        access_token = get_fb_auth.token
        puts graph = Koala::Facebook::API.new(access_token)
        @user.first_name = get_fb_auth.name
        fb_feed = graph.get_connection("verge", "posts")
      rescue Exception => msg
        puts "--error--", msg
      end
      #/feed?fields=comments.summary(true),likes.summary(true)
      fb_feed.each do |post|
        p = Post.new
        p.feed_id = feed.id
        p.f_id = post["id"]
        p.content = post["message"]
        p.date = post["created_time"]
        p.comments = graph.get_connection(post["id"], "comments").to_s
        p.likes = graph.get_object(post["id"], :fields => "likes.summary(true)")["likes"]["summary"]["total_count"]
        p.save
      end
    end
  end

  def create_tw
    feed = @user.feeds.find_by_provider("twitter")
    if !feed
      feed = Feed.new
      feed.provider = "twitter"
      feed.user_id = @user.id
      feed.save
      begin
        client_tw = Twitter::REST::Client.new do |config|
          config.consumer_key        = ENV["TWITTER_KEY"]
          config.consumer_secret     = ENV["TWITTER_SECRET"]
          config.access_token        = get_tw_auth.token
          config.access_token_secret = get_tw_auth.secret
        end
        tw_feed = client_tw.home_timeline
      rescue Exception => msg
        puts "--error--", msg
      end

       tw_feed.each do |post|
        p = Post.new
        p.feed_id = feed.id
        p.f_id = post.id
        p.content = post.text
        p.likes = post.favorite_count
        p.save
      end
    end
  end

  def create_ig
    feed = @user.feeds.find_by_provider("instagram")
    if !feed
      feed = Feed.new
      feed.provider = "instagram"
      feed.user_id = @user.id
      feed.save
      begin
        client = Instagram.client(:access_token => get_ig_auth.token)
        ig_feed = client.user_recent_media
      rescue Exception => msg
        puts "--error--", msg
      end

      ig_feed.each do |post|
        p = Post.new
        p.feed_id = feed.id

        p.f_id = post.id
        p.content = post.caption.text
        p.likes = post.likes["count"]
        p.save
      end
    end
  end



  def set_user
    @user = current_user
  end

end
