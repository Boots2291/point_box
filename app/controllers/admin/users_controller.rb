class Admin::UsersController < ApplicationController

  before_action :require_admin

  def require_admin
    render file: "/public/404" unless current_admin?
  end

  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to admin_users_path
    else
      redirect_to new_admin_user_path
    end
  end

  def edit
    @user = User.find(params[:id])
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