class DevicesController < ApplicationController

  def index
    @user = User.find_by(id: params[:user_id])
    if @user
      @devices = @user.devices.all
    else
      @devices = Device.all
    end
  end
  
end
