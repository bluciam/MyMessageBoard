class PostsController < ApplicationController
  def new
    @post = Post.new
  end

  def create
    @post = Post.new(params.require(:post).permit(:title, :content))
    @post.user = current_user
    @post.save
    if @post.errors.any?
      render :new
    else
      redirect_to posts_path
    end
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    attributes = params.require(:post).permit(:title, :content)
    @post.update_attributes(attributes)

    if @post.errors.any?
      render :update
    else
      redirect_to @post
    end
  end

  def index
    @posts = Post.all
  end

  def show
    @post = Post.find(params[:id])
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to posts_path
  end
end
