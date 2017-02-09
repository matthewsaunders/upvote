class CommentsController < ApplicationController

  before_filter :find_post, only: [:index, :create]

  def index
    @comment = Comment.new
    @comments = Comment.where(post_id: params[:post_id])
  end

  def create
    comment = Comment.new(comment_params)
    comment.post_id = params[:post_id]
    comment.user = current_user

    if comment.save
      redirect_to post_comments_path(params[:post_id])
    else
      render "index"
    end
  end

  private
    def comment_params
      params.require(:comment).permit(:text)
    end

    def find_post
      @post = Post.find(params[:post_id])
    end
end
