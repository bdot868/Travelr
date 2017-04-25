class PostsController < ApplicationController
  def index
    @post = Post.all
  end

  def show
    @post = Post.find(params[:id])
  end

  def new
    @post = Post.new
  end

  def edit
    @post = Post.find(params[:id])
  end

  def create

    # u = Post.find post_params[:post][:user_id]
    # p = Post.new
    # p.title = params[:post][:title]
    # p.body = params[:post][:body]
    # p.user = u
    # p.save
    # redirect_to user_path(u.id)

    @post = Post.new(post_params)
    @post.user_id = current_user.id
    if @post.save
      redirect_to user_path(current_user.id)
    else
      render :new
    end
  end

  def update
    @post = Post.find(params[:id])

    if @post.update_attributes(post_params)
      redirect_to post_path(@post)
    else
      redirect_to edit_post_path(@post)
    end
  end

  def destroy
    @post = Post.find params[:id]
    @post.destroy
    redirect_to user_path(current_user.id)
  end

  private

  def post_params
    params.require(:post).permit(:id, :user_id, :title, :body, :pic_url, :_destroy)
  end
end
