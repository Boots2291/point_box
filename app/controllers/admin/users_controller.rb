class Admin::UsersController < ApplicationController

  before_action :require_admin

  def require_admin
    render file: "/public/404" unless current_admin?
  end

  def index
    @users = User.all
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    @user.update(points: params[:user][:points])

    redirect_to admin_users_path
  end
end