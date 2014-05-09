class RepliesController < ApplicationController
  def new
    @reply = Reply.new
  end

  def create
    @reply = Reply.new(params.require(:reply).permit(:content))
    @reply.user = current_user
    @reply.post = Post.find(params["post_id"])
    @reply.save
    if @reply.errors.any?
      render :new
    else
      redirect_to post_path(@reply.post)
    end
  end

  def edit
  end
end
