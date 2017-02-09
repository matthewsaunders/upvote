class PostsController < ApplicationController

  before_action :authenticate_user!, except: [:index]

  before_filter :find_post, only: [:show, :edit, :update, :destroy]

  def index
    @posts = Post.all
  end

  def new
    @post = Post.new
  end

  def create
    post = Post.new(post_params)
    post.user = current_user

    if post.save
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
    redirect_to @post.link
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
