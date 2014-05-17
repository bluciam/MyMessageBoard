class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    attributes = params.require(:user).permit(:email, :lastname, :firstname)
    @user = User.find(params[:id])
    @user.update_attributes(attributes)

    if @user.errors.any?
      render :edit
    else
      redirect_to @user
    end
  end

  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
  end
end
