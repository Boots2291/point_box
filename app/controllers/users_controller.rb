class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to user_path(@user)
    else
      redirect_to root_path
    end
  end

  def show
    @user = User.find(params[:id])
    render file: "/public/404" unless current_user.id == @user.id
  end

  def update
    @user = User.find(params[:id])
    @user.update(points: params[:user][:points])

    redirect_to admin_users_path
  end

  private

  def user_params
    params.require(:user).permit(:username, :password)
  end
end