class PostsController < ApplicationController

  before_filter :find_post, only: [:find, :edit, :update, :destroy]

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

  def edit
  end

  def update
    if @post.update(post_params)
      redirect_to posts_path
    else
      render "edit"
    end
  end

  def show
  end

  def destroy
  end

  private
    def post_params
      params.require(:post).permit(:title, :link)
    end

    def find_post
      @post = Post.find(params[:id])
    end

end
