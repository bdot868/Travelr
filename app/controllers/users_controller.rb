class UsersController < ApplicationController
  before_action :authorize, only: [:show]

  def index
    @user = User.all
    @post = Post.first(6)
  end

  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to user_path(@user.id)
    end
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private

  def user_params
    params.require(:user).permit(:id, :username, :name, :email, :password, :city)
  end

end
