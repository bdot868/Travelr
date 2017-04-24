class PostsController < ApplicationController
  def index
    @post = Post.all
  end

  def show
    @post = Post.find(params[:id])
  end

  def edit
  end

  def create
  end

  def update
  end

  def destroy
  end
end
