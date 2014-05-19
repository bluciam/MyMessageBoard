class RepliesController < ApplicationController
  before_action :load_reply, only: :create
  load_and_authorize_resource

  def new
    @reply = Reply.new
  end

  def create
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

  private
    def load_reply
      @reply = Reply.new(reply_params)
    end

    def reply_params
      params.require(:reply).permit(:content)
    end
end
