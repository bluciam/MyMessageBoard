class UsersController < ApplicationController
  before_action :load_post, only: :create
  load_and_authorize_resource

  def new
    @user = User.new
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
#    attributes = params.require(:user).permit(:email, :lastname, :firstname)
    @user = User.find(params[:id])
    @user.update_attributes(user_params)

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

  private
  def load_user
    @user = User.new(user_params)
  end

  def user_params
    params.require(:user).permit(
      :email, :firstname, :lastname
    )
  end

end

