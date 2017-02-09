class CommentsController < ApplicationController

  def index
    @comment = Comment.new
    @comments = Comment.where(post_id: params[:post_id])
  end
end
