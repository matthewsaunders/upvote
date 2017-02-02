class PostsController < ApplicationController

  def index
    @posts = Post.all
  end

  def new
    @post = Post.new
  end

  def create
    if Post.create(post_params)
      redirect_to posts_path
    else
      render "new"
    end
  end

  private
    def post_params
      params.require(:post).permit(:title, :link)
    end

    def find_post
      @post = Post.find(params[:id])
    end

end
