class CommentsController < ApplicationController
  before_action :find_post

  def new
    @comment = Comment.new
  end

  def create
    @post = Post.find(params[:post_id])
    @comment = @post.comments.new(comment_params)
    @comment.body = params[:comment][:body]
    @comment.user = current_user
    if @comment.save
    redirect_to post_path(@post)
  else
    redirect_to root_path
  end
  end

  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy
      redirect_to post_path
  end

  private

  def find_post
    @post = Post.find(params[:post_id])
  end

  def comment_params
    params.require(:comment).permit(:id, :body, :user_id)
  end

end
