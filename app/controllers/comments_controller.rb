class CommentsController < ApplicationController

  before_action :require_login

  def create
    @user = current_user
    @device = Device.find(params[:device_id])
    @comment = @device.comments.create(comment_params)

    if @comment.save
      redirect_to device_path(@device)
    else
      redirect_to device_path(@device)
    end
  end

  def destroy
    @device= Device.find(params[:hdevice_id])
    @comment = Comment.find(params[:id])

    if current_user.id == @comment.user_id
      @comment.destroy
      redirect_to device_path(@device)
    else
      redirect_to device_path(@device)
    end
  end

  private

    def comment_params
      params.require(:comment).permit(:user_id, :device_id, :content)
    end

end
