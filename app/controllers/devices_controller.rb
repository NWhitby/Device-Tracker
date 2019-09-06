class DevicesController < ApplicationController
  
  before_action :require_login, except: [:index]

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

  def show
    @user = current_user

    @device ||= Device.find(params[:id])
    @comment = Comment.new(device: @device)
  end

  def update
    @device = Device.find(params[:id])

    if current_user.id == @Device.user_id
      @device.update(device_params)
      redirect_to device_path(@device)
    else
      redirect_to edit_device_path(@device)
    end
  end

  def destroy
    @device = Device.find(params[:id])

    if current_user.id == @device.user_id
      @device.destroy
      redirect_to user_devices_path(current_user)
    else 
      redirect_to device_path(@device)
    end
  end

  private

    def device_params
      params.require(:device).permit(:name, :description, :user_id,)
    end
  
end
