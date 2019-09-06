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

end
