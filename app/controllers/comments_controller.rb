class CommentsController < ApplicationController

  before_action :require_login

  def create
    @user = current_user
    @device = Device.find(params[:device_id])
    @comment = @device.comments.create(comment_params)

    if @comment.save
      redirect_to device_path(@device), success: "Comment created."
    else
      redirect_to device_path(@device), danger: "Please try again."
    end
  end

  def destroy
    @device= Device.find(params[:device_id])
    @comment = Comment.find(params[:id])

    if current_user.id == @comment.user_id
      @comment.destroy
      redirect_to device_path(@device), info: "Comment deleted."
    else
      redirect_to device_path(@device), warning: "Comment must be deleted by owner."
    end
  end

  private

    def comment_params
      params.require(:comment).permit(:user_id, :device_id, :content)
    end

end
