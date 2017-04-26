class PostsController < ApplicationController
  def index
    @posts = Post.all
  end

  def search
    @posts = Post.where("body ILIKE ?", "%#{params[:query]}%")
    render "posts/index"
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

    @city = City.last
    @post = Post.new(post_params)
    @post.user = current_user
    @post.city = @city

    if @post.save
      redirect_to post_path(@post.id)
    else
      redirect_to posts_path
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
    if current_user == @post.user
      if @post.destroy
          redirect_to user_path(@post.user_id)
        end
      else
    redirect_to posts_path
  end
  end

  private

  def post_params
    params.require(:post).permit(:image, :id, :city_id, :user_id, :title, :body, :pic_url, :_destroy)
  end
end
