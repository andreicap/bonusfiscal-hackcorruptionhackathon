
class PostsController < ApplicationController
  before_action :set_post, only: [:show]

  def show
    get_alchemy
    

  end

private
    # Use callbacks to share common setup or constraints between actions.
    def set_post
      @post = Post.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def post_params
      params.fetch(:post, {})
    end

    def get_alchemy
      # EasyTranslate.api_key = 'AIzaSyB1r3abwQulFPKY_RpduJlonl-x0wHLy7w'

      if @post.feed.provider=="facebook"
        @comments = eval(@post.comments)
        comms = ""
        @comments.each do |c|
          comms<<" "<<c["message"]
        end
        if !@post.sentiments
          puts "---chechking sentiment"
          @sentiments = JSON.parse(RestClient.post  "http://access.alchemyapi.com/calls/text/TextGetEmotion", 
                               {"apikey" => "a80cbd86063836c4449ee05bcae650761cf4fc70", 
                                 "outputMode" => "json",
                                 "text"=> comms})
          puts "---chechking sentiment"
          @post.sentiments = @sentiments
          @post.save
        end
        @sentiment_data = eval(@post.sentiments)["docEmotions"]
      end

      if @post.feed.provider=="twitter"
        if !@post.sentiments
          puts "---chechking sentiment"
          @sentiments = JSON.parse(RestClient.post  "http://access.alchemyapi.com/calls/text/TextGetEmotion", 
                               {"apikey" => "a80cbd86063836c4449ee05bcae650761cf4fc70", 
                                 "outputMode" => "json",
                                 "text"=> @post.content})
          puts "---chechking sentiment"
          @post.sentiments = @sentiments
          @post.save
        end
        @sentiment_data = eval(@post.sentiments)["docEmotions"]
      end

       if @post.feed.provider=="instagram"
        if !@post.sentiments
          puts "---chechking sentiment"
          @sentiments = JSON.parse(RestClient.post  "http://access.alchemyapi.com/calls/text/TextGetEmotion", 
                               {"apikey" => "a80cbd86063836c4449ee05bcae650761cf4fc70", 
                                 "outputMode" => "json",
                                 "text"=> @post.content})
          puts "---chechking sentiment"
          @post.sentiments = @sentiments
          @post.save
        end
        @sentiment_data = eval(@post.sentiments)["docEmotions"]
      end

    end
  end
