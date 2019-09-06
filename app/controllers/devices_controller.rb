class DevicesController < ApplicationController

  def index
    @user = User.find_by(id: params[:user_id])
    
    if @user
      @devices = @user.devices.all
    else
      @devices = Device.all
    end
  end

  def new
    @device = Device.new
  end

  def create
    @user = current_user

    @device = current_user.devices.build(device_params)
    if @device.save
      redirect_to user_devices_path(current_user)
    else
      render 'new'
    end
  end
  
end
