class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def show
    if session[:user_id]
      @user = User.find(params[:id])
    else
      redirect_to '/'
    end
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to user_devices_url(@user), success: "Sign in successful."
    else
      redirect_to new_user_path, danger: "Please try again."
    end
  end

  private
   
    def user_params
      params.require(:user).permit(:username, :email, :password)
    end

end
