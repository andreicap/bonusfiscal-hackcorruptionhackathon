class PostsController < ApplicationController
  before_action :set_post, only: [:show]

  def show
    puts "-------------", @post.content
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
end
