class SessionsController < ApplicationController
   
  def new
    @user = User.new
  end

  def create
    @user = User.find_by(username: params[:username])

    if @user && @user.authenticate(params[:password])
      login
    else
      redirect_to '/'
    end
  end

  def destroy
    session.destroy
    redirect_to root_path
  end

  private

  def login
    session[:user_id] = @user.id
    redirect_to user_path(@user)
  end

end
